import { Component, OnInit, OnDestroy, TemplateRef} from '@angular/core';
import { PageEvent } from '@angular/material';
import { Subscription } from 'rxjs';
import { EscortAgent } from '../../model/escort-agent.model';
import { EscortsDetailAgentService } from '../../service/escort-detail-agent.service';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { AuthAgentService } from '../../service/auth-agent.service';
import { AgentService } from '../../service/agent.service';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';

@Component({
  selector: 'app-escort-list',
  templateUrl: './escort-list.component.html',
  styleUrls: ['./escort-list.component.css']
})
export class EscortListComponent implements OnInit, OnDestroy {

  escorts: EscortAgent[] = [];
  agentId: string;
  isLoading = false;
  totalEscorts = 0;
  escortsPerPage = 5;
  currentPage = 1;
  pageSizeOptions = [1, 2, 5, 10];
  subscriptionStatus: string;
  private escortsSub: Subscription;
  modalRef: BsModalRef;



  constructor(
    public escortsDetailService: EscortsDetailAgentService,
    public agentService: AgentService,
    private cookieService: CookieService,
    private router: Router,
    public modalService: BsModalService,
    public authService: AuthAgentService) {}

  ngOnInit() {

    this.isLoading = true;
    this.agentId = this.authService.getAgentId();
    this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage, this.agentId);
    this.escortsSub = this.escortsDetailService.getEscortsUpdateListener()
    .subscribe((escortData: {escorts: EscortAgent[], escortCount: number}) => {

        this.isLoading = false;
        this.totalEscorts = escortData.escortCount;
        this.escorts = escortData.escorts;
        console.log(this.escorts);
    });

  }



  onChangedPage(pageData: PageEvent) {
    this.isLoading = true;
    console.log(pageData.pageIndex);
    this.currentPage = pageData.pageIndex + 1;
    this.escortsPerPage = pageData.pageSize;
    console.log(this.currentPage);
    this.escortsDetailService.getEscorts(this.escortsPerPage, this.currentPage, this.agentId);
  }

  ngOnDestroy() {
    this.escortsSub.unsubscribe();
  }


}
