//
//  ViewController.swift
//  Charts-Demo
//
//  Created by 劉 天宇 on 2020/11/11.
//

import UIKit
import Charts
import TinyConstraints

class ViewController: UIViewController {

    lazy var lineChartView: LineChartView = {
        
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .systemFont(ofSize: 8)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 8)
        xAxis.setLabelCount(yValues.count - 1, force: false)
        xAxis.labelTextColor = .white
        xAxis.axisLineColor = .white
        
        chartView.animate(xAxisDuration: 1.5)
        
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        setData()
    }
    
    func setData() {
        let set = LineChartDataSet(entries: yValues, label: "Subscribers")
        
        set.mode = .cubicBezier
        set.drawCirclesEnabled = false
        set.lineWidth = 0.5
        set.setColor(.white)
        set.fill = Fill(color: .white)
        set.fillAlpha = 0.5
        set.drawFilledEnabled = true
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.highlightColor = .white
        
        let data = LineChartData(dataSet: set)
        data.setValueTextColor(.white)
        lineChartView.data = data
    }
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 5241106),
        ChartDataEntry(x: 1.0, y: 5087884),
        ChartDataEntry(x: 2.0, y: 4675426),
        ChartDataEntry(x: 3.0, y: 5446225),
        ChartDataEntry(x: 4.0, y: 5842937),
        ChartDataEntry(x: 5.0, y: 6490790),
        ChartDataEntry(x: 6.0, y: 6905569),
        ChartDataEntry(x: 7.0, y: 6644904),
        ChartDataEntry(x: 8.0, y: 7292721),
        ChartDataEntry(x: 9.0, y: 7247189),
        ChartDataEntry(x: 10.0, y: 7394776),
    ]
}

// MARK: - ChartViewDelegate

extension ViewController: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
    }
}
