import { Component, OnInit } from '@angular/core';
import { AuthEscortService } from '../../service/auth-escort.service';
import { EscortService } from '../../service/escort.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-support',
  templateUrl: './support.component.html',
  styleUrls: ['./support.component.css']
})
export class SupportComponent implements OnInit {
  comment: string;
  email: string;
  escortId: string;
  constructor(
    public authService: AuthEscortService,
    public escortService: EscortService,
    private router: Router,
    private toastr: ToastrService) { }

  ngOnInit() {
    this.email = this.authService.getEmail();
    console.log(this.email);
    this.escortId = this.authService.getEscortId();
  }

  onSave() {
    if(this.comment){
      this.escortService.addSupport(this.escortId, this.email, this.comment).subscribe((response) => {
        this.toastr.success(response.message);
        this.router.navigate(['/']);
      });
    }
  }

}
