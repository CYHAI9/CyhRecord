#### 集成
```
pod 'CyhRecord'
```
```
#import <CyhRecord/CyhRecord.h>
```
#### 使用
##### 录音
```
 [[CyhRecordManager manager] audioRecorderWithName:@"myRecord" Success:^(AVAudioRecorder * _Nonnull audioRecorder) {
            NSLog(@"录音器OK");
        } finish:^(NSString * _Nonnull path) {
            NSLog(@"录音文件路径：%@",path);
        } Fail:^(NSError * _Nonnull error) {
            
        }];
```
##### 停止录音
```
        [[CyhRecordManager manager] stopRecord];
```
##### 播放录音
```
 [[CyhRecordManager manager] audioPlayerWithUrl:@"myRecord" Success:^(AVAudioPlayer * _Nonnull audioPlayer) {
            NSLog(@"播放器OK:");
            self->isPlaying = YES;
        } Progress:^(CGFloat progress) {
            
            NSLog(@"播放进度:%lf",progress);
            self.progressSlider.value = progress;
        } Finish:^(AVAudioPlayer * _Nonnull audioPlayer, BOOL finish) {
            NSLog(@"播放完成");
            self->isPlaying = NO;
        } Fail:^(NSError * _Nonnull error) {
            NSLog(@"播放出错");
            
        }];
```
使用过上面的方法初始化后，可直接使用的播放
```
 [[CyhRecordManager manager] startPaly];
```
##### 暂停
```
        [[CyhRecordManager manager] pausePlay];
```
##### 停止
```
    [[CyhRecordManager manager] stopPlay];
```
##### 调节播放进度
```
    [[CyhRecordManager manager] setPlayProgress:sender.value];
```
##### 调节音量
```
    [[CyhRecordManager manager] volume:1.0];
```
##### 删除录音文件
```
 [[CyhRecordManager manager] removeRecordFileWithName:@"myRecord" Result:^(BOOL success, NSString * _Nonnull msg) {
        
    }];
```
##### 查找录音文件
```
  NSString * path = [[CyhRecordManager manager] getRecordFileWithName:@"myRecord"];
```
