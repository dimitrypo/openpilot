#pragma once

#ifndef NO_SR
#include "omx_encoder.h"
#endif
#include "blocking_queue.h"

#include "selfdrive/ui/qt/onroad/buttons.h"

class ScreenRecorder : public QPushButton {
#ifdef NO_SR
  public:
    explicit ScreenRecorder(QWidget *parent = nullptr){}
    ~ScreenRecorder() override{}

    void updateScreen(){}
#else
  Q_OBJECT

public:
  explicit ScreenRecorder(QWidget *parent = 0);
  ~ScreenRecorder() override;

  void updateScreen(double fps, bool started);

protected:
  void paintEvent(QPaintEvent *event) override;

private slots:
  void toggleRecording();

protected:
  void paintEvent(QPaintEvent *event) override;

private slots:
  void toggleRecording();

private:
  void closeEncoder();
  void encodingThreadFunction();
  void openEncoder(const std::string &filename);
  void paintEvent(QPaintEvent *event) override;
  void start();
  void stop();
  void toggleRecording();

  BlockingQueue<QImage> imageQueue{UI_FREQ};
  BlockingQueue<QImage> encodeQueue{UI_FREQ};

  QWidget *rootWidget;

  bool recording;

  int screenHeight = 1080;
  int screenWidth = 2160;

  long long started_time;

  std::thread encodingThread;

  std::unique_ptr<OmxEncoder> encoder;

  std::unique_ptr<uint8_t[]> rgbScaleBuffer;

  std::thread encodingThread;
#endif
};
