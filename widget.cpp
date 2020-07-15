#include <QApplication>
#include "widget.h"
#include<QPushButton>
#include<QLayout>


void examplelayout()
{
    QWidget *mainWin = new QWidget();
    mainWin->resize(800,480);
    mainWin->setWindowTitle("搞一个大项目");
   // mainWin->setStyleSheet("background:green");
    //创建按钮
    QPushButton *btnReply = new QPushButton("");
    QPushButton *btnLogin = new QPushButton("");
    QPushButton *btnConfig = new QPushButton("");

    //配置尺寸
    //qDebug("Before ");



    //创建布局器
    QHBoxLayout *mainlayout = new QHBoxLayout();

    //添加按钮
    //mainlayout->addWidget(btnReply);
    //插入一个空隙
   // mainlayout->addSpacing(100);
    mainlayout->addWidget(btnLogin);
   // mainlayout->addSpacing(100);
    mainlayout->addWidget(btnConfig);

    //拉伸因子
    mainlayout->setStretchFactor(btnReply,2);//1:1缩放
//    //添加1个拉伸因子
//    mainlayout->addStretch(1);
    mainlayout->setStretchFactor(btnLogin,2);//1:1缩放
    mainlayout->setStretchFactor(btnConfig,2);//1:1缩放
    //插入1个拉伸因子
    mainlayout->insertStretch(3,1);
    mainlayout->insertStretch(2,1);
    mainlayout->insertStretch(1,1);
    mainlayout->insertStretch(0,1);

    QVBoxLayout *vLayout = new QVBoxLayout();
    vLayout->addLayout(mainlayout);
    vLayout->setStretch(0,1);
    vLayout->insertStretch(0,1);
    vLayout->insertStretch(2,1);
    vLayout->addWidget(new QPushButton("Test"));


    //配置按钮尺寸
//    btnReply->setMaximumSize(100,100);
//    btnReply->setMinimumSize(48,48);
//    btnLogin->setMaximumSize(100,100);
//    btnLogin->setMinimumSize(48,48);
//    btnConfig->setMaximumSize(100,100);
//    btnConfig->setMinimumSize(48,48);

    //配置按钮策略
    btnReply->setSizePolicy(QSizePolicy::Preferred,QSizePolicy::Preferred);
    btnLogin->setSizePolicy(QSizePolicy::Preferred,QSizePolicy::Preferred);
    btnConfig->setSizePolicy(QSizePolicy::Preferred,QSizePolicy::Preferred);


    //应用到界面上
    mainWin->setLayout(vLayout);

    //样式表可指定某一类控件，或者某个控件
    //样式表可存入单独文件，配置时进行调取

    btnReply->setStyleSheet("background-color:purple;color:white");
    btnLogin->setStyleSheet("background-color:purple;color:white");
    btnConfig->setStyleSheet("background-color:purple;color:white");
    //QPushButton("Test").setStyleSheet("background-color:purple;color:white");


    //显示
    mainWin->show();
}


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    examplelayout();
    return a.exec();
}
