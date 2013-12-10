#include "MainWindow.h"
#include "ui_MainWindow.h"

#include "aquila/source/generator/SineGenerator.h"
#include "aquila/source/generator/PinkNoiseGenerator.h"


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // generate some data:
//    QVector<double> x(101), y(101); // initialize with entries 0..100
//    for (int i=0; i<101; ++i)
//    {
//      x[i] = i/50.0 - 1; // x goes from -1 to 1
//      y[i] = x[i]*x[i];  // let's plot a quadratic function
//    }

//    // create graph and assign data to it:


    double key = 0;

    ui->plot->addGraph();
    Aquila::SineGenerator gen_sin(1000);
    gen_sin.setFrequency(32).setAmplitude(0.1).generate(1000);


    key = 0;
    for (Aquila::SignalSource::iterator iter = gen_sin.begin();
         iter != gen_sin.end();
         iter ++ )
    {
        double value = *iter + 0.4;
        ui->plot->graph(0)->addData(key, value);
        key += 1/gen_sin.getSampleFrequency();
    }



    ui->plot->addGraph();
    Aquila::PinkNoiseGenerator gen_niose(500);
    gen_niose.setFrequency(32).setAmplitude(0.2).generate(500);


    key = 0;
    for (Aquila::SignalSource::iterator iter = gen_niose.begin();
         iter != gen_niose.end();
         iter ++ )
    {
        double value = *iter + 0.2;
        ui->plot->graph(1)->addData(key, value);
        key += 1/gen_niose.getSampleFrequency();
    }


    ui->plot->addGraph();
    Aquila::SignalSource gen_sum = gen_sin + gen_niose;

    key = 0;
    for (Aquila::SignalSource::iterator iter = gen_sum.begin();
         iter != gen_sum.end();
         iter ++ )
    {
        double value = *iter + 0.0;
        ui->plot->graph(2)->addData(key, value);
        key += 1/gen_sum.getSampleFrequency();
    }


    // give the axes some labels:
    ui->plot->xAxis->setLabel("x");
    ui->plot->yAxis->setLabel("y");
    // set axes ranges, so we see all data:
    ui->plot->xAxis->setRange(-1, 1);
    ui->plot->yAxis->setRange(0, 1);

    // Allow user to drag axis ranges with mouse, zoom with mouse wheel and select graphs by clicking:
    ui->plot->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
}

MainWindow::~MainWindow()
{
    delete ui;
}
