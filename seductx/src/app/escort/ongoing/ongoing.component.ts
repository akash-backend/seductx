import { Component, OnInit, OnDestroy} from '@angular/core';
import { PageEvent } from '@angular/material';
import { Subscription } from 'rxjs';
import { AuthEscortService } from '../../service/auth-escort.service';
import { EscortService } from '../../service/escort.service';

import { Booking } from '../../model/booking.model';
import { RequestService } from '../../service/request.service';
import { CookieService } from 'ngx-cookie-service';
import { UserService } from '../../service/user.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-ongoing',
  templateUrl: './ongoing.component.html',
  styleUrls: ['./ongoing.component.css']
})
export class OngoingComponent implements OnInit, OnDestroy {

  escortId: string;
  requests: Booking[] = [];
  isLoading = false;
  totalRequests = 0;
  requestsPerPage = 5;
  currentPage = 1;
  pageSizeOptions = [1, 2, 5, 10];
  private requestsSub: Subscription;
  subscriptionStatus: string;
  requestCount: string;
  acceptCount: string;
  ongoingCount: string;
  completedCount: string;


  constructor(
    public authService: AuthEscortService,
    public requestService: RequestService,
    public escortService: EscortService,
    private cookieService: CookieService,
    public userService: UserService,
    private toastr: ToastrService
    ) {}


  ngOnInit() {
    this.escortId = this.authService.getEscortId();
    this.isLoading = true;
    this.requestService.getRequests(this.requestsPerPage, this.currentPage, '3', this.escortId);
    this.requestsSub = this.requestService.getRequestsUpdateListener()
    .subscribe((requestData: {requests: Booking[], requestCount: number}) => {

        this.isLoading = false;
        this.totalRequests = requestData.requestCount;
        this.requests = requestData.requests;
        console.log(this.requests);
    });

    this.escortService.getSubscriptionStatus(this.escortId)
    .subscribe((subscriptionData) => {
        this.subscriptionStatus = subscriptionData.subscription_status;
    });

    this.requestService.getRequestCount(this.escortId)
    .subscribe(requestCountData => {
      this.requestCount = requestCountData.requestCount;
      this.acceptCount = requestCountData.acceptCount;
      this.ongoingCount = requestCountData.ongoingCount;
      this.completedCount = requestCountData.completedCount;
    });
  }


  onChangedPage(pageData: PageEvent) {
    this.isLoading = true;
    this.currentPage = pageData.pageIndex + 1;
    this.requestsPerPage = pageData.pageSize;
    console.log(this.currentPage);
    this.requestService.getRequests(this.requestsPerPage, this.currentPage , '3' , this.escortId);
  }




  onCompleted(bookingId: string, escortId: string, userId: string) {
    this.isLoading = true;
    this.requestService.bookingStatusManage(bookingId, escortId, userId, '4').subscribe(() => {
      this.requestService.getRequests(this.requestsPerPage, this.currentPage , '3' , this.escortId);
    });
  }



  videoCall(bookingId: string , userId: string) {
    this.userService.getSubscriptionStatus(userId)
    .subscribe((subscriptionData) => {
      if (subscriptionData.subscription_status != '1') {
        this.toastr.error(`User is not premium and video chat won't function`);
        } else {
          console.log(bookingId);
          this.cookieService.set('myId', bookingId);

          window.location.href = 'https://www.seductx.com:3000/';
        }
    });
  }



  ngOnDestroy() {
    this.requestsSub.unsubscribe();
  }

}
