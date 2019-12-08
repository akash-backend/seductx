import { Injectable } from '@angular/core';
import * as io from 'socket.io-client';
import {Observable} from 'rxjs';

@Injectable({ providedIn: 'root'})

export class OnlineService {

    private socket = io('https://www.seductx.com:5000');

    escortOnline(data) {
        this.socket.emit('IamOnline', data);
    }

    escortOffline(data) {
      console.log('offline sdfhsidufhsdf');
      console.log(data);
        this.socket.emit('IamOffline', data);
    }
}
