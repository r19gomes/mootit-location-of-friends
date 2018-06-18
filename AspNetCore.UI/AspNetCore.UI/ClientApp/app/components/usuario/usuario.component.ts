import { Component, OnInit, NgZone, Inject } from '@angular/core';
import { Http } from '@angular/http';
import { Router } from "@angular/router";

@Component({
    selector: 'usuario',
    templateUrl: './usuario.component.html'
})
export class UsuarioComponent implements OnInit {

    constructor(
        public forecasts: WeatherForecast[],
        public http: Http, 
        @Inject('BASE_URL') baseUrl: string,
        public router: Router,
        private zone: NgZone
    ) {        
        http.get(baseUrl + 'api/SampleData/WeatherForecasts').subscribe(result => {
            this.forecasts = result.json() as WeatherForecast[];
        }, error => console.error(error));
    }

    ngOnInit() { }

    gotoEsqueciSenha() {
        this.zone.run(() => {            
            alert('1');
            //this.router.navigate(["/cadastro/resgatar-senha"]);
        });
    }

}

interface WeatherForecast {
    dateFormatted: string;
    temperatureC: number;
    temperatureF: number;
    summary: string;
}