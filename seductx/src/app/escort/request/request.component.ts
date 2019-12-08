import { Component, OnInit, OnDestroy, TemplateRef} from '@angular/core';
import { PageEvent } from '@angular/material';
import { Subscription } from 'rxjs';
import {OnlineService} from '../../service/online.service';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { EscortService } from '../../service/escort.service';
import { AuthEscortService } from '../../service/auth-escort.service';
import { EscortProfile } from '../../model/escortProfile.model';

import { Booking } from '../../model/booking.model';
import { RequestService } from '../../service/request.service';



@Component({
  selector: 'app-request',
  templateUrl: './request.component.html',
  styleUrls: ['./request.component.css']
})
export class RequestComponent implements OnInit, OnDestroy {
  escortInfo: EscortProfile;
  escortId: string;
  modalRef: BsModalRef;
  onlineStatus: boolean;
  requestCount: string;
  acceptCount: string;
  ongoingCount: string;
  completedCount: string;


  // request list start
  requests: Booking[] = [];
  isLoading = false;
  totalRequests = 0;
  requestsPerPage = 5;
  currentPage = 1;
  pageSizeOptions = [1, 2, 5, 10];
  private requestsSub: Subscription;
  // request list end


  // time interval
  timeArray: any;
  presentTime: string;
  intervalArray =  [];
  m: any;

  constructor(
    public onlineService: OnlineService,
    public modalService: BsModalService,
    public escortService: EscortService,
    public authService: AuthEscortService,
    public requestService: RequestService,
    ) {}


  ngOnInit() {
    this.escortId = this.authService.getEscortId();
    this.escortService.getProfileInfo(this.escortId)
    .subscribe(escortData => {
      if (escortData.escortinfo.online_status === '2') {
        document.getElementById('openModalOnlineButton').click();
        this.onlineStatus = false;
      } else {
        this.onlineStatus = true;
      }
    });

    // request list start
    this.isLoading = true;
    this.requestService.getRequests(this.requestsPerPage, this.currentPage, '0', this.escortId);
    this.requestsSub = this.requestService.getRequestsUpdateListener()
    .subscribe((requestData: {requests: Booking[], requestCount: number}) => {

        this.isLoading = false;
        this.totalRequests = requestData.requestCount;
        this.requests = requestData.requests;

        // set timer interval start
        if (this.requests.length > 0) {
        for (const requestValue of this.requests) {
          let intervalData = setInterval(() => {
            this.startTimer('timer' + requestValue.booking_id, requestValue.booking_id,requestValue.user_id,requestValue.escort_id);
          }, 1000);
          this.intervalArray.push(intervalData);
        }
      }
        // set timer interval end
    });

    this.requestService.getRequestCount(this.escortId)
    .subscribe(requestCountData => {
      this.requestCount = requestCountData.requestCount;
      this.acceptCount = requestCountData.acceptCount;
      this.ongoingCount = requestCountData.ongoingCount;
      this.completedCount = requestCountData.completedCount;
    });
  }




  startTimer(idName: string, bookingId: string, escortId: string, userId: string) {
    this.presentTime = document.getElementById(idName).innerHTML;
    this.timeArray = this.presentTime.split(/[:]+/);
    let m = this.timeArray[0];
    let s = this.timeArray[1];

    if (m === '0' && s === '0') {
      this.onNotNow(bookingId, escortId, userId);
    } else {
      // tslint:disable-next-line: radix
      s = parseInt(this.checkSecond((this.timeArray[1] - 1)));
      if (s === 59) {
        m = m - 1;
      }
    }

    document.getElementById(idName).innerHTML =
      m + ':' + s;

  }

  checkSecond(sec) {
    if (sec < 10 && sec >= 0) {sec = '0' + sec}; // add zero in front of numbers < 10
    if (sec < 0) {sec = '59'};
    return sec;
  }


  onChangedPage(pageData: PageEvent) {
    this.isLoading = true;
    this.currentPage = pageData.pageIndex + 1;
    this.requestsPerPage = pageData.pageSize;
    this.requestService.getRequests(this.requestsPerPage, this.currentPage , '0' , this.escortId);
  }

  public openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
  }

  onlineProviderPopup() {
    this.onlineService.escortOnline({userId: this.escortId});
    this.onlineStatus = true;
    this.modalRef.hide();
  }

  onCheckOnline(ev) {
    if (ev.target.checked) {
      console.log('checkedsdfsdfsdf');
      this.onlineService.escortOnline({userId: this.escortId});
    } else {
      console.log('uncheckedsdfsdfsdf');
      console.log(this.escortId);
      this.onlineService.escortOffline({userId: this.escortId});
    }
  }

  onNotNow(bookingId: string, escortId: string, userId: string) {
    this.isLoading = true;
    this.requestService.bookingStatusManage(bookingId, escortId, userId, '2').subscribe(() => {
      this.requestService.getRequests(this.requestsPerPage, this.currentPage , '0' , this.escortId);
    });
  }


  onAccept(bookingId: string, escortId: string, userId: string) {
    this.isLoading = true;
    this.requestService.bookingStatusManage(bookingId, escortId, userId, '1').subscribe(() => {
      this.requestService.getRequests(this.requestsPerPage, this.currentPage , '0' , this.escortId);
    });
  }


  ngOnDestroy() {
    this.requestsSub.unsubscribe();
    this.intervalArray.forEach(function(element) {
      clearInterval(element);
    });
  }

}
