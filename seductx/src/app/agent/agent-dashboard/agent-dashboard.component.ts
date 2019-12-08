import { Component, OnInit } from '@angular/core';
import { AgentService } from '../../service/agent.service';
import { AuthAgentService } from '../../service/auth-agent.service';
import { AgentProfile } from '../../model/agentProfile.model';

@Component({
  selector: 'app-agent-dashboard',
  templateUrl: './agent-dashboard.component.html',
  styleUrls: ['./agent-dashboard.component.css']
})
export class AgentDashboardComponent implements OnInit {

  agentInfo: AgentProfile[] = [];
  agentId: string;
  constructor(public agentService: AgentService , public authService: AuthAgentService) {}

  ngOnInit() {
    this.agentId = this.authService.getAgentId();
    console.log(this.agentId);
    this.agentService.getProfileInfo(this.agentId)
    .subscribe(agentData => {
      this.agentInfo = agentData.agentinfo;
    });
  }

}
