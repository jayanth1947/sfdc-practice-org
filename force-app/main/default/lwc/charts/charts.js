import { api, LightningElement } from 'lwc';
import chartJS from '@salesforce/resourceUrl/chartJS';
import {loadScript} from 'lightning/platformResourceLoader'
export default class Charts extends LightningElement {

    isChartJsInitialized
    chart
    @api type
    @api chartData
    @api chartHeading
    @api chartLabels


    renderedCallback(){
        if (this.isChartJsInitialized) {
            return;
        }
        loadScript(this,chartJS+'/chartJs/Chart.js').then(()=>{
            console.log("ChartJS loaded Successfully");
            this.isChartJsInitialized=true;
            this.loadCharts()
        }).catch(error=>{
            console.error(error);
        })
    }

    loadCharts(){
        window.Chart.platform.disableCSSInjection=true

        const canvas=document.createElement('canvas')
        this.template.querySelector('div.chart').appendChild(canvas)
        const ctx=canvas.getContext('2d')
        this.chart=new window.Chart(ctx,this.config())
    }

    config(){
        return {
            type: this.type,
            data: {
              labels: this.chartLabels ? this.chartLabels:[],
              datasets: [{
                label: this.chartHeading,
                data: this.chartData ? this.chartData:[],
                backgroundColor:[
                    'rgba(255,99,132,0.2)',
                    'rgba(54,162,235,0.2)',
                    'rgba(255,206,86,0.2)',
                    'rgba(75,192,192,0.2)',
                    'rgba(153,218,255,0.2)',
                    'rgba(255,159,64,0.2)'
                ],
                borderWidth: 1
              }]
            },
            options: {
              responsive:true,
              legend:{
                    position:'right'
              },
              animation:{
                animateScale :true,
                animateRotate:true
              }
            }
          }
    }
}