import { Component, OnInit, OnDestroy, TemplateRef} from '@angular/core';
import { PageEvent } from '@angular/material';
import { Subscription } from 'rxjs';
import { Escort } from '../../../model/escort.model';
import { EscortsDetailService } from '../../../service/escort-detail.service';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { AuthService } from '../../../service/auth.service';
import { UserService } from '../../../service/user.service';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';


@Component({
  selector: 'app-online',
  templateUrl: './online.component.html',
  styleUrls: ['./online.component.css']
})
export class OnlineComponent implements OnInit, OnDestroy {

  escorts: Escort[] = [];
  userId: string;
  isLoading = false;
  totalEscorts = 0;
  escortsPerPage = 5;
  currentPage = 1;
  pageSizeOptions = [1, 2, 5, 10];
  subscriptionStatus: string;
  private escortsSub: Subscription;

  call: string;
  city: string;
  time: string;
  hour: string;
  gender: string;


  url: string;
  text: string;
  imageUrl: string;


  modalRef: BsModalRef;



  constructor(
    public escortsDetailService: EscortsDetailService,
    public userService: UserService,
    private cookieService: CookieService,
    private router: Router,
    public modalService: BsModalService,
    public authService: AuthService) {}

  ngOnInit() {
    this.url = 'http://jasonwatmore.com';
    this.text = `Jason Watmore's Blog | A Web Developer in Sydney`;
    this.imageUrl = 'http://jasonwatmore.com/_content/images/jason.jpg';
    this.isLoading = true;
    this.userId = this.authService.getUserId();
    this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage, '1', this.userId, '2');
    this.escortsSub = this.escortsDetailService.getEscortsUpdateListener()
    .subscribe((escortData: {escorts: Escort[], escortCount: number}) => {

        this.isLoading = false;
        this.totalEscorts = escortData.escortCount;
        this.escorts = escortData.escorts;
        console.log(this.escorts);
    });


    this.userService.getSubscriptionStatus(this.userId)
    .subscribe((subscriptionData) => {
        this.subscriptionStatus = subscriptionData.subscription_status;
    });




    // cookie set start
    this.gender = this.cookieService.get('filter_gender');
    this.call = this.cookieService.get('filter_call');
    this.city = this.cookieService.get('filter_city');
    this.time = this.cookieService.get('filter_time');
    this.hour = this.cookieService.get('filter_hour');
    // cookie set end
  }



  onChangeSorting(sortType: string) {
    this.cookieService.set('sortType', sortType);
    this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage, '1', this.userId, '2');
  }


  onChangedPage(pageData: PageEvent) {
    this.isLoading = true;
    console.log(pageData.pageIndex);
    this.currentPage = pageData.pageIndex + 1;
    this.escortsPerPage = pageData.pageSize;
    console.log(this.currentPage);
    this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage , '1', this.userId, '2');
  }


  public openModal(template: TemplateRef<any>, escortId: string, profileImage: string) {
    this.cookieService.set( 'share_escort', escortId);
    this.cookieService.set( 'share_profileImage', profileImage);
    this.modalRef = this.modalService.show(template);
  }




  resetFilter() {
    this.cookieService.delete('filter_start_age');
    this.cookieService.delete('filter_end_age');
    this.cookieService.delete('filter_start_height');
    this.cookieService.delete('filter_end_height');
    this.cookieService.delete('filter_body_type');
    this.cookieService.delete('filter_cup_size');
    this.cookieService.delete('filter_service');
    this.cookieService.delete('filter_agent');
    this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage, '1', this.userId, '2');
  }

  addFavourate(escort_id: string, status: string) {
    this.escortsDetailService.addFavourite(this.userId, escort_id, status).subscribe(() => {
      this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage, '1', this.userId, '2');
    });
  }


  addFollow(escort_id: string, status: string) {
    this.escortsDetailService.addFollow(this.userId, escort_id, status).subscribe(() => {
      this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage, '1', this.userId, '2');
    });
  }






  ngOnDestroy() {
    this.escortsSub.unsubscribe();
  }

}
