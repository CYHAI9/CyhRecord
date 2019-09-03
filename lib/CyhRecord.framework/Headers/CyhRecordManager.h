//
//  CyhRecordManager.h
//  CyhRecordManager
//
//  Created by ChenYinHai on 2019/9/2.
//  Copyright © 2019 cyhai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioUnit/AudioUnit.h>
#import <AVFoundation/AVFoundation.h>
#import <Speech/Speech.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CyhRecordManager : NSObject<AVAudioRecorderDelegate,AVAudioPlayerDelegate>


/**
 初始化管理单例
 */
+ (instancetype)manager;

/**
 录音--录音文件名字
 */
- (void)audioRecorderWithName:(NSString *)filename Success:(void(^)(AVAudioRecorder * audioRecorder))complet finish:(void(^)(NSString * path))finish Fail:(void(^)(NSError *error))fail;

/**
 停止录音
 */
- (void)stopRecord;

/**
 播放音频
 */
- (void)audioPlayerWithUrl:(NSString *)url Success:(void(^)(AVAudioPlayer * audioPlayer))complet Progress:(void(^)(CGFloat progress))progress Finish:(void(^)(AVAudioPlayer * audioPlayer,BOOL finish))finish Fail:(void(^)(NSError *error))fail;

/**
 继续播放音频，在未初始化状态，无效
 */
- (void)startPaly;

/**
 停止播放，最初始状态
 */
- (void)stopPlay;

/**
 暂停n播放
 */
- (void)pausePlay;

/**
 语音识别（暂未加入
 */
- (void)initSpeechVoice;

/**
 音量，0.0-1.0
 */
- (void)volume:(CGFloat)e;

/**
 调整播放进度，0.0-1.0
 */
- (void)setPlayProgress:(CGFloat)p;

@end

NS_ASSUME_NONNULL_END
