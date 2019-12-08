import { Component, OnInit, OnDestroy, TemplateRef} from '@angular/core';
import { PageEvent } from '@angular/material';
import { Subscription } from 'rxjs';
import { AuthEscortService } from '../../../service/auth-escort.service';

import { Booking } from '../../../model/booking.model';
import { RequestService } from '../../../service/request.service';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { EscortService } from '../../../service/escort.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-completed',
  templateUrl: './completed.component.html',
  styleUrls: ['./completed.component.css']
})
export class CompletedComponent implements OnInit, OnDestroy {

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
  requestCount: string;
  acceptCount: string;
  ongoingCount: string;
  completedCount: string;


  constructor(
    public authService: AuthEscortService,
    public requestService: RequestService,
    public modalService: BsModalService,
    public escortService: EscortService,
    private toastr: ToastrService,
    public route: ActivatedRoute
    ) {}


  ngOnInit() {
    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
      this.isLoading = true;
      this.requestService.getRequests(this.requestsPerPage, this.currentPage, '4', this.escortId);
      this.requestsSub = this.requestService.getRequestsUpdateListener()
      .subscribe((requestData: {requests: Booking[], requestCount: number}) => {

          this.isLoading = false;
          this.totalRequests = requestData.requestCount;
          this.requests = requestData.requests;
          console.log(this.requests);
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
    this.requestService.getRequests(this.requestsPerPage, this.currentPage , '4' , this.escortId);
  }

  public openModal(template: TemplateRef<any>, userId: string) {
    this.modalRef = this.modalService.show(template);
    this.userId = userId;
  }

  addRatting() {
    this.modalRef.hide();
    console.log(this.escortId);
    console.log(this.userId);
    console.log(this.currentRate);
    this.escortService.addRatting(this.escortId, this.userId, this.currentRate).subscribe(response => {
      if (response.success  === '1') {
        this.toastr.success(response.message);
      } else {
        this.toastr.error(response.message);
      }
      this.requestService.getRequests(this.requestsPerPage, this.currentPage , '4' , this.escortId);
    });
  }


  ngOnDestroy() {
    this.requestsSub.unsubscribe();
  }

}
