//
//  ViewController.m
//  CyhRecordManager
//
//  Created by ChenYinHai on 2019/9/2.
//  Copyright © 2019 cyhai. All rights reserved.
//

#import "ViewController.h"
#import <CyhRecord/CyhRecord.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@end

@implementation ViewController
{
    BOOL isPlaying;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_progressSlider addTarget:self action:@selector(changeProgress:forEvent:) forControlEvents: UIControlEventValueChanged];
    // Do any additional setup after loading the view.
}
- (IBAction)playClicked:(UIButton *)sender {
    
    if (!isPlaying) {
        
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
    }
    else
    {
        [[CyhRecordManager manager] startPaly];
    }
    
    
}

- (IBAction)recordClicked:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [[CyhRecordManager manager] audioRecorderWithName:@"myRecord" Success:^(AVAudioRecorder * _Nonnull audioRecorder) {
            NSLog(@"录音器OK");
        } finish:^(NSString * _Nonnull path) {
            NSLog(@"录音文件路径：%@",path);
        } Fail:^(NSError * _Nonnull error) {
            
        }];
    }
    else
    {
        [[CyhRecordManager manager] stopRecord];
    }
   
}

- (IBAction)pausePlay:(UIButton *)sender {
    
    [[CyhRecordManager manager] pausePlay];
}
- (IBAction)stopPlay:(UIButton *)sender {
    [[CyhRecordManager manager] stopPlay];
    isPlaying = NO;
}

- (void)changeProgress:(UISlider *)sender forEvent:(UIEvent*)event {
   
    UITouch*touchEvent = [[event allTouches]anyObject];
    if (touchEvent.phase == UITouchPhaseBegan) {
        
        NSLog(@"拉取开始");
        [[CyhRecordManager manager] pausePlay];

    }
    else if(touchEvent.phase == UITouchPhaseEnded)
    {
        NSLog(@"拉取结束");
        [[CyhRecordManager manager] setPlayProgress:sender.value];
        [[CyhRecordManager manager] startPaly];

    }
}

@end
