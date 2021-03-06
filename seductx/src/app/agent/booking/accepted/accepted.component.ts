import { Component, OnInit, OnDestroy} from '@angular/core';
import { ChatService } from 'src/app/service/chat.service';
import { PageEvent } from '@angular/material';
import { Subscription } from 'rxjs';
import { AuthEscortService } from '../../../service/auth-escort.service';
import { EscortService } from '../../../service/escort.service';

import { Booking } from '../../../model/booking.model';
import { RequestService } from '../../../service/request.service';
import { CookieService } from 'ngx-cookie-service';
import { ActivatedRoute, ParamMap } from '@angular/router';


@Component({
  selector: 'app-accepted',
  templateUrl: './accepted.component.html',
  styleUrls: ['./accepted.component.css']
})
export class AcceptedComponent implements OnInit, OnDestroy {

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
    public chatService: ChatService,
    public authService: AuthEscortService,
    public escortService: EscortService,
    public requestService: RequestService,
    private cookieService: CookieService,
    public route: ActivatedRoute
    ) {}


  ngOnInit() {
    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
      this.isLoading = true;
      this.requestService.getRequests(this.requestsPerPage, this.currentPage, '1', this.escortId);
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

    });
  }


  onChangedPage(pageData: PageEvent) {
    this.isLoading = true;
    this.currentPage = pageData.pageIndex + 1;
    this.requestsPerPage = pageData.pageSize;
    console.log(this.currentPage);
    this.requestService.getRequests(this.requestsPerPage, this.currentPage , '1' , this.escortId);
  }

  onNotNow(bookingId: string, escortId: string, userId: string) {
    this.isLoading = true;
    this.requestService.bookingStatusManage(bookingId, escortId, userId, '2').subscribe(() => {
      this.requestService.getRequests(this.requestsPerPage, this.currentPage , '1' , this.escortId);
    });
  }


  onStart(bookingId: string, escortId: string, userId: string) {
    this.isLoading = true;
    this.requestService.bookingStatusManage(bookingId, escortId, userId, '3').subscribe(() => {
      this.requestService.getRequests(this.requestsPerPage, this.currentPage , '1' , this.escortId);
    });
  }

  videoCall(userId: string) {
    console.log(userId);
    console.log(this.escortId);
    this.cookieService.set('otherId', userId);
    this.cookieService.set('myId', this.escortId);

    window.location.href = 'https://www.seductx.com:3000/';
  }


  ngOnDestroy() {
    this.requestsSub.unsubscribe();
  }
}
