import { Component, OnInit} from '@angular/core';
import { AuthService } from './service/auth.service';
import { AuthEscortService } from './service/auth-escort.service';
import { AuthAgentService } from './service/auth-agent.service';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  constructor(
    private authService: AuthService,
    private authEscortService: AuthEscortService,
    private authAgentService: AuthAgentService) {}

  ngOnInit() {
    this.authService.autoAuthUser();
    this.authEscortService.autoAuthEscort();
    this.authAgentService.autoAuthAgent();
  }
}
