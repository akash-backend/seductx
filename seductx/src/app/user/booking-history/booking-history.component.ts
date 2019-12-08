import { Component, OnInit, OnDestroy,  TemplateRef} from '@angular/core';
import { PageEvent } from '@angular/material';
import { Subscription } from 'rxjs';
import { AuthService } from '../../service/auth.service';
import { UserService } from '../../service/user.service';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { CookieService } from 'ngx-cookie-service';
import { EscortService } from '../../service/escort.service';


import { Booking } from '../../model/booking.model';
import { BookingHistoryService } from '../../service/booking-history.service';


@Component({
  selector: 'app-booking-history',
  templateUrl: './booking-history.component.html',
  styleUrls: ['./booking-history.component.css']
})
export class BookingHistoryComponent implements OnInit, OnDestroy {
  currentRate: string;
  escortId: string;
  userId: string;
  modalRef: BsModalRef;
  requests: Booking[] = [];
  isLoading = false;
  totalRequests = 0;
  requestsPerPage = 5;
  currentPage = 1;
  pageSizeOptions = [1, 2, 5, 10];
  private requestsSub: Subscription;
  subscriptionStatus: string;


  constructor(
    public authService: AuthService,
    public userService: UserService,
    public bookingHistoryService: BookingHistoryService,
    public modalService: BsModalService,
    private toastr: ToastrService,
    private cookieService: CookieService,
    public escortService: EscortService,
    ) {}


  ngOnInit() {
    this.currentRate = '1';
    this.userId = this.authService.getUserId();
    this.isLoading = true;
    this.bookingHistoryService.getRequests(this.requestsPerPage, this.currentPage, this.userId);
    this.requestsSub = this.bookingHistoryService.getRequestsUpdateListener()
    .subscribe((requestData: {requests: Booking[], requestCount: number}) => {

        this.isLoading = false;
        this.totalRequests = requestData.requestCount;
        this.requests = requestData.requests;
        console.log(this.requests);
    });


    this.userService.getSubscriptionStatus(this.userId)
    .subscribe((subscriptionData) => {
        this.subscriptionStatus = subscriptionData.subscription_status;
    });
  }


  onChangedPage(pageData: PageEvent) {
    this.isLoading = true;
    this.currentPage = pageData.pageIndex + 1;
    this.requestsPerPage = pageData.pageSize;
    this.bookingHistoryService.getRequests(this.requestsPerPage, this.currentPage , this.userId);
  }

  // onNotNow(bookingId: string, userId: string, userId: string) {
  //   this.isLoading = true;
  //   this.bookingHistoryService.bookingStatusManage(bookingId, userId, userId, '2').subscribe(() => {
  //     this.bookingHistoryService.getRequests(this.requestsPerPage, this.currentPage , '1' , this.userId);
  //   });
  // }

  onDelete(bookingId: string) {
    this.isLoading = true;
    this.bookingHistoryService.deleteBooking(bookingId).subscribe(() => {
      this.bookingHistoryService.getRequests(this.requestsPerPage, this.currentPage , this.userId);
    });
  }


  public openModal(template: TemplateRef<any>, escortId: string) {
    this.modalRef = this.modalService.show(template);
    this.escortId = escortId;
  }

  addRatting() {
    this.modalRef.hide();
    console.log(this.escortId);
    console.log(this.userId);
    console.log(this.currentRate);
    this.userService.addRatting(this.escortId, this.userId, this.currentRate).subscribe(response => {
      if (response.success  === '1') {
        this.toastr.success(response.message);
      } else {
        this.toastr.error(response.message);
      }
      this.bookingHistoryService.getRequests(this.requestsPerPage, this.currentPage , this.userId);
    });
  }


  videoCall(bookingId: string , escortId: string) {
    this.escortService.getSubscriptionStatus(escortId)
    .subscribe((subscriptionData) => {
        if (subscriptionData.subscription_status != '1') {
          this.toastr.error(`Provider is not premium and video chat won't function`);
        } else {
          this.cookieService.set('myId', bookingId);
          console.log(this.cookieService.get('myId'));
          window.location.href = 'https://www.seductx.com:3000/';
        }
    });
  }

  ngOnDestroy() {
    this.requestsSub.unsubscribe();
  }

}
