import StandardMessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMessageCodec';
import BasicMessageChannel, { Reply } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BasicMessageChannel';
import { BinaryMessenger,TaskQueue } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';
import MessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/MessageCodec';
import { ByteBuffer } from '@ohos/flutter_ohos/src/main/ets/util/ByteBuffer';


/** Error class for passing custom error details to Flutter via a thrown PlatformException. */
export class FlutterError implements Error {

  /** The error code. */
  public code: string;

  /** The error name. */
  public name: string;

  /** The error message. */
  public message: string;
  /** The error stack. */
  public stack?: string;

  constructor(code: string, name: string,  message: string, stack?: string)
  {
    this.code = code;
    this.name = name;
    this.message = message;
    this.stack = stack;
  }
}

function wrapError(error: Error): Array<Object> {
  let errorList: Array<Object> = new Array<Object>(3);
  if (error instanceof FlutterError) {
    let err: FlutterError = error as FlutterError;
    errorList[0] = err.code;
    errorList[1] = err.name;
    errorList[2] = err.message;
  } else {
    errorList[0] = error.toString();
    errorList[1] = error.name;
    errorList[2] = "Cause: " + error.message + ", Stacktrace: " + error.stack;
  }
  return errorList;
}


/*
*  视频水印类型
*
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum NERtcVideoWatermarkType {
  /*图片*/
  K_NERTC_VIDEO_WATERMARK_TYPE_IMAGE,
  /*文字*/
  K_NERTC_VIDEO_WATERMARK_TYPE_TEXT,
  /*时间戳*/
  K_NERTC_VIDEO_WATERMARK_TYPE_TIME_STAMP
}

/*
*  视频水印类型
*
*  Generated enum Companion class from Pigeon that represents data sent
   in messages.Do not delete otherwise enum type data transfer will failed
*/
export class NERtcVideoWatermarkTypeEnum {
  index:number|null = null;
constructor(index:number){
    this.index = index;
  }
}

/*
*  摄像头额外旋转信息
*
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum NERtcCaptureExtraRotation {
  /*（默认）没有额外的旋转信息，直接使用系统旋转参数处理*/
  K_NERTC_CAPTURE_EXTRA_ROTATION_DEFAULT,
  /*在系统旋转信息的基础上，额外顺时针旋转90度*/
  K_NERTC_CAPTURE_EXTRA_ROTATION_CLOCK_WISE90,
  /*在系统旋转信息的基础上，额外旋转180度*/
  K_NERTC_CAPTURE_EXTRA_ROTATION180,
  /*在系统旋转信息的基础上，额外逆时针旋转90度*/
  K_NERTC_CAPTURE_EXTRA_ROTATION_ANTI_CLOCK_WISE90
}

/*
*  摄像头额外旋转信息
*
*  Generated enum Companion class from Pigeon that represents data sent
   in messages.Do not delete otherwise enum type data transfer will failed
*/
export class NERtcCaptureExtraRotationEnum {
  index:number|null = null;
constructor(index:number){
    this.index = index;
  }
}

/*
*  onUserJoined 回调的一些可选信息
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class NERtcUserJoinExtraInfo {
  private customInfo?: string;

  public setCustomInfo(customInfo:string):void {
    this.customInfo = customInfo;
  }

  getCustomInfo(): string | undefined{
    return this.customInfo;
  }

  constructor(customInfo?: string) {
    this.customInfo = customInfo;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.customInfo !==undefined){
      arr.push(this.customInfo);
    }
    return arr;
  }

  static fromList(arr: Object[]): NERtcUserJoinExtraInfo {
    let pigeonResult: NERtcUserJoinExtraInfo = new NERtcUserJoinExtraInfo();
    let customInfo: Object = arr[0];
    pigeonResult.setCustomInfo(customInfo as string);
    return pigeonResult;
  }
}

/*
*  onUserLeave 回调的一些可选信息
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class NERtcUserLeaveExtraInfo {
  private customInfo?: string;

  public setCustomInfo(customInfo:string):void {
    this.customInfo = customInfo;
  }

  getCustomInfo(): string | undefined{
    return this.customInfo;
  }

  constructor(customInfo?: string) {
    this.customInfo = customInfo;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.customInfo !==undefined){
      arr.push(this.customInfo);
    }
    return arr;
  }

  static fromList(arr: Object[]): NERtcUserLeaveExtraInfo {
    let pigeonResult: NERtcUserLeaveExtraInfo = new NERtcUserLeaveExtraInfo();
    let customInfo: Object = arr[0];
    pigeonResult.setCustomInfo(customInfo as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class UserJoinedEvent {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private joinExtraInfo?: NERtcUserJoinExtraInfo;

  public setJoinExtraInfo(joinExtraInfo:NERtcUserJoinExtraInfo):void {
    this.joinExtraInfo = joinExtraInfo;
  }

  getJoinExtraInfo(): NERtcUserJoinExtraInfo | undefined{
    return this.joinExtraInfo;
  }

  constructor(uid?: number, joinExtraInfo?: NERtcUserJoinExtraInfo) {
    this.uid = uid;
    this.joinExtraInfo = joinExtraInfo;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.joinExtraInfo !==undefined){
      arr.push(this.joinExtraInfo);
    }
    return arr;
  }

  static fromList(arr: Object[]): UserJoinedEvent {
    let pigeonResult: UserJoinedEvent = new UserJoinedEvent();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let joinExtraInfo: Object = arr[1];
    pigeonResult.setJoinExtraInfo(joinExtraInfo as NERtcUserJoinExtraInfo);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class UserLeaveEvent {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private reason?: number;

  public setReason(reason:number):void {
    this.reason = reason;
  }

  getReason(): number | undefined{
    return this.reason;
  }

  private leaveExtraInfo?: NERtcUserLeaveExtraInfo;

  public setLeaveExtraInfo(leaveExtraInfo:NERtcUserLeaveExtraInfo):void {
    this.leaveExtraInfo = leaveExtraInfo;
  }

  getLeaveExtraInfo(): NERtcUserLeaveExtraInfo | undefined{
    return this.leaveExtraInfo;
  }

  constructor(uid?: number, reason?: number, leaveExtraInfo?: NERtcUserLeaveExtraInfo) {
    this.uid = uid;
    this.reason = reason;
    this.leaveExtraInfo = leaveExtraInfo;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.reason !==undefined){
      arr.push(this.reason);
    }
    if(this.leaveExtraInfo !==undefined){
      arr.push(this.leaveExtraInfo);
    }
    return arr;
  }

  static fromList(arr: Object[]): UserLeaveEvent {
    let pigeonResult: UserLeaveEvent = new UserLeaveEvent();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let reason: Object = arr[1];
    pigeonResult.setReason(reason as number);
    let leaveExtraInfo: Object = arr[2];
    pigeonResult.setLeaveExtraInfo(leaveExtraInfo as NERtcUserLeaveExtraInfo);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class UserVideoMuteEvent {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private muted?: boolean;

  public setMuted(muted:boolean):void {
    this.muted = muted;
  }

  getMuted(): boolean | undefined{
    return this.muted;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(uid?: number, muted?: boolean, streamType?: number) {
    this.uid = uid;
    this.muted = muted;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.muted !==undefined){
      arr.push(this.muted);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): UserVideoMuteEvent {
    let pigeonResult: UserVideoMuteEvent = new UserVideoMuteEvent();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let muted: Object = arr[1];
    pigeonResult.setMuted(muted as boolean);
    let streamType: Object = arr[2];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class FirstVideoDataReceivedEvent {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(uid?: number, streamType?: number) {
    this.uid = uid;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): FirstVideoDataReceivedEvent {
    let pigeonResult: FirstVideoDataReceivedEvent = new FirstVideoDataReceivedEvent();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let streamType: Object = arr[1];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class FirstVideoFrameDecodedEvent {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private width?: number;

  public setWidth(width:number):void {
    this.width = width;
  }

  getWidth(): number | undefined{
    return this.width;
  }

  private height?: number;

  public setHeight(height:number):void {
    this.height = height;
  }

  getHeight(): number | undefined{
    return this.height;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(uid?: number, width?: number, height?: number, streamType?: number) {
    this.uid = uid;
    this.width = width;
    this.height = height;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.width !==undefined){
      arr.push(this.width);
    }
    if(this.height !==undefined){
      arr.push(this.height);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): FirstVideoFrameDecodedEvent {
    let pigeonResult: FirstVideoFrameDecodedEvent = new FirstVideoFrameDecodedEvent();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let width: Object = arr[1];
    pigeonResult.setWidth(width as number);
    let height: Object = arr[2];
    pigeonResult.setHeight(height as number);
    let streamType: Object = arr[3];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class VirtualBackgroundSourceEnabledEvent {
  private enabled?: boolean;

  public setEnabled(enabled:boolean):void {
    this.enabled = enabled;
  }

  getEnabled(): boolean | undefined{
    return this.enabled;
  }

  private reason?: number;

  public setReason(reason:number):void {
    this.reason = reason;
  }

  getReason(): number | undefined{
    return this.reason;
  }

  constructor(enabled?: boolean, reason?: number) {
    this.enabled = enabled;
    this.reason = reason;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.enabled !==undefined){
      arr.push(this.enabled);
    }
    if(this.reason !==undefined){
      arr.push(this.reason);
    }
    return arr;
  }

  static fromList(arr: Object[]): VirtualBackgroundSourceEnabledEvent {
    let pigeonResult: VirtualBackgroundSourceEnabledEvent = new VirtualBackgroundSourceEnabledEvent();
    let enabled: Object = arr[0];
    pigeonResult.setEnabled(enabled as boolean);
    let reason: Object = arr[1];
    pigeonResult.setReason(reason as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AudioVolumeInfo {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private volume?: number;

  public setVolume(volume:number):void {
    this.volume = volume;
  }

  getVolume(): number | undefined{
    return this.volume;
  }

  private subStreamVolume?: number;

  public setSubStreamVolume(subStreamVolume:number):void {
    this.subStreamVolume = subStreamVolume;
  }

  getSubStreamVolume(): number | undefined{
    return this.subStreamVolume;
  }

  constructor(uid?: number, volume?: number, subStreamVolume?: number) {
    this.uid = uid;
    this.volume = volume;
    this.subStreamVolume = subStreamVolume;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.volume !==undefined){
      arr.push(this.volume);
    }
    if(this.subStreamVolume !==undefined){
      arr.push(this.subStreamVolume);
    }
    return arr;
  }

  static fromList(arr: Object[]): AudioVolumeInfo {
    let pigeonResult: AudioVolumeInfo = new AudioVolumeInfo();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let volume: Object = arr[1];
    pigeonResult.setVolume(volume as number);
    let subStreamVolume: Object = arr[2];
    pigeonResult.setSubStreamVolume(subStreamVolume as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class RemoteAudioVolumeIndicationEvent {
  private volumeList?: Array<AudioVolumeInfo>;

  public setVolumeList(volumeList:Array<AudioVolumeInfo>):void {
    this.volumeList = volumeList;
  }

  getVolumeList(): Array<AudioVolumeInfo> | undefined{
    return this.volumeList;
  }

  private totalVolume?: number;

  public setTotalVolume(totalVolume:number):void {
    this.totalVolume = totalVolume;
  }

  getTotalVolume(): number | undefined{
    return this.totalVolume;
  }

  constructor(volumeList?: Array<AudioVolumeInfo>, totalVolume?: number) {
    this.volumeList = volumeList;
    this.totalVolume = totalVolume;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.volumeList !==undefined){
      arr.push(this.volumeList);
    }
    if(this.totalVolume !==undefined){
      arr.push(this.totalVolume);
    }
    return arr;
  }

  static fromList(arr: Object[]): RemoteAudioVolumeIndicationEvent {
    let pigeonResult: RemoteAudioVolumeIndicationEvent = new RemoteAudioVolumeIndicationEvent();
    let volumeList: Object = arr[0];
    pigeonResult.setVolumeList(volumeList as Array<AudioVolumeInfo>);
    let totalVolume: Object = arr[1];
    pigeonResult.setTotalVolume(totalVolume as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class Rectangle {
  private x?: number;

  public setX(x:number):void {
    this.x = x;
  }

  getX(): number | undefined{
    return this.x;
  }

  private y?: number;

  public setY(y:number):void {
    this.y = y;
  }

  getY(): number | undefined{
    return this.y;
  }

  private width?: number;

  public setWidth(width:number):void {
    this.width = width;
  }

  getWidth(): number | undefined{
    return this.width;
  }

  private height?: number;

  public setHeight(height:number):void {
    this.height = height;
  }

  getHeight(): number | undefined{
    return this.height;
  }

  constructor(x?: number, y?: number, width?: number, height?: number) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.x !==undefined){
      arr.push(this.x);
    }
    if(this.y !==undefined){
      arr.push(this.y);
    }
    if(this.width !==undefined){
      arr.push(this.width);
    }
    if(this.height !==undefined){
      arr.push(this.height);
    }
    return arr;
  }

  static fromList(arr: Object[]): Rectangle {
    let pigeonResult: Rectangle = new Rectangle();
    let x: Object = arr[0];
    pigeonResult.setX(x as number);
    let y: Object = arr[1];
    pigeonResult.setY(y as number);
    let width: Object = arr[2];
    pigeonResult.setWidth(width as number);
    let height: Object = arr[3];
    pigeonResult.setHeight(height as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class ScreenCaptureSourceData {
  private type?: number;

  public setType(type:number):void {
    this.type = type;
  }

  getType(): number | undefined{
    return this.type;
  }

  private sourceId?: number;

  public setSourceId(sourceId:number):void {
    this.sourceId = sourceId;
  }

  getSourceId(): number | undefined{
    return this.sourceId;
  }

  private status?: number;

  public setStatus(status:number):void {
    this.status = status;
  }

  getStatus(): number | undefined{
    return this.status;
  }

  private action?: number;

  public setAction(action:number):void {
    this.action = action;
  }

  getAction(): number | undefined{
    return this.action;
  }

  private captureRect?: Rectangle;

  public setCaptureRect(captureRect:Rectangle):void {
    this.captureRect = captureRect;
  }

  getCaptureRect(): Rectangle | undefined{
    return this.captureRect;
  }

  private level?: number;

  public setLevel(level:number):void {
    this.level = level;
  }

  getLevel(): number | undefined{
    return this.level;
  }

  constructor(type?: number, sourceId?: number, status?: number, action?: number, captureRect?: Rectangle, level?: number) {
    this.type = type;
    this.sourceId = sourceId;
    this.status = status;
    this.action = action;
    this.captureRect = captureRect;
    this.level = level;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.type !==undefined){
      arr.push(this.type);
    }
    if(this.sourceId !==undefined){
      arr.push(this.sourceId);
    }
    if(this.status !==undefined){
      arr.push(this.status);
    }
    if(this.action !==undefined){
      arr.push(this.action);
    }
    if(this.captureRect !==undefined){
      arr.push(this.captureRect);
    }
    if(this.level !==undefined){
      arr.push(this.level);
    }
    return arr;
  }

  static fromList(arr: Object[]): ScreenCaptureSourceData {
    let pigeonResult: ScreenCaptureSourceData = new ScreenCaptureSourceData();
    let type: Object = arr[0];
    pigeonResult.setType(type as number);
    let sourceId: Object = arr[1];
    pigeonResult.setSourceId(sourceId as number);
    let status: Object = arr[2];
    pigeonResult.setStatus(status as number);
    let action: Object = arr[3];
    pigeonResult.setAction(action as number);
    let captureRect: Object = arr[4];
    pigeonResult.setCaptureRect(captureRect as Rectangle);
    let level: Object = arr[5];
    pigeonResult.setLevel(level as number);
    return pigeonResult;
  }
}

/*
*  上下行 Last mile 网络质量探测结果
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class NERtcLastmileProbeResult {
  private state?: number;

  public setState(state:number):void {
    this.state = state;
  }

  getState(): number | undefined{
    return this.state;
  }

  private rtt?: number;

  public setRtt(rtt:number):void {
    this.rtt = rtt;
  }

  getRtt(): number | undefined{
    return this.rtt;
  }

  private uplinkReport?: NERtcLastmileProbeOneWayResult;

  public setUplinkReport(uplinkReport:NERtcLastmileProbeOneWayResult):void {
    this.uplinkReport = uplinkReport;
  }

  getUplinkReport(): NERtcLastmileProbeOneWayResult | undefined{
    return this.uplinkReport;
  }

  private downlinkReport?: NERtcLastmileProbeOneWayResult;

  public setDownlinkReport(downlinkReport:NERtcLastmileProbeOneWayResult):void {
    this.downlinkReport = downlinkReport;
  }

  getDownlinkReport(): NERtcLastmileProbeOneWayResult | undefined{
    return this.downlinkReport;
  }

  constructor(state?: number, rtt?: number, uplinkReport?: NERtcLastmileProbeOneWayResult, downlinkReport?: NERtcLastmileProbeOneWayResult) {
    this.state = state;
    this.rtt = rtt;
    this.uplinkReport = uplinkReport;
    this.downlinkReport = downlinkReport;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.state !==undefined){
      arr.push(this.state);
    }
    if(this.rtt !==undefined){
      arr.push(this.rtt);
    }
    if(this.uplinkReport !==undefined){
      arr.push(this.uplinkReport);
    }
    if(this.downlinkReport !==undefined){
      arr.push(this.downlinkReport);
    }
    return arr;
  }

  static fromList(arr: Object[]): NERtcLastmileProbeResult {
    let pigeonResult: NERtcLastmileProbeResult = new NERtcLastmileProbeResult();
    let state: Object = arr[0];
    pigeonResult.setState(state as number);
    let rtt: Object = arr[1];
    pigeonResult.setRtt(rtt as number);
    let uplinkReport: Object = arr[2];
    pigeonResult.setUplinkReport(uplinkReport as NERtcLastmileProbeOneWayResult);
    let downlinkReport: Object = arr[3];
    pigeonResult.setDownlinkReport(downlinkReport as NERtcLastmileProbeOneWayResult);
    return pigeonResult;
  }
}

/*
*  单向 Last mile 网络质量探测结果报告
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class NERtcLastmileProbeOneWayResult {
  private packetLossRate?: number;

  public setPacketLossRate(packetLossRate:number):void {
    this.packetLossRate = packetLossRate;
  }

  getPacketLossRate(): number | undefined{
    return this.packetLossRate;
  }

  private jitter?: number;

  public setJitter(jitter:number):void {
    this.jitter = jitter;
  }

  getJitter(): number | undefined{
    return this.jitter;
  }

  private availableBandwidth?: number;

  public setAvailableBandwidth(availableBandwidth:number):void {
    this.availableBandwidth = availableBandwidth;
  }

  getAvailableBandwidth(): number | undefined{
    return this.availableBandwidth;
  }

  constructor(packetLossRate?: number, jitter?: number, availableBandwidth?: number) {
    this.packetLossRate = packetLossRate;
    this.jitter = jitter;
    this.availableBandwidth = availableBandwidth;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.packetLossRate !==undefined){
      arr.push(this.packetLossRate);
    }
    if(this.jitter !==undefined){
      arr.push(this.jitter);
    }
    if(this.availableBandwidth !==undefined){
      arr.push(this.availableBandwidth);
    }
    return arr;
  }

  static fromList(arr: Object[]): NERtcLastmileProbeOneWayResult {
    let pigeonResult: NERtcLastmileProbeOneWayResult = new NERtcLastmileProbeOneWayResult();
    let packetLossRate: Object = arr[0];
    pigeonResult.setPacketLossRate(packetLossRate as number);
    let jitter: Object = arr[1];
    pigeonResult.setJitter(jitter as number);
    let availableBandwidth: Object = arr[2];
    pigeonResult.setAvailableBandwidth(availableBandwidth as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class RtcServerAddresses {
  private valid?: boolean;

  public setValid(valid:boolean):void {
    this.valid = valid;
  }

  getValid(): boolean | undefined{
    return this.valid;
  }

  private channelServer?: string;

  public setChannelServer(channelServer:string):void {
    this.channelServer = channelServer;
  }

  getChannelServer(): string | undefined{
    return this.channelServer;
  }

  private statisticsServer?: string;

  public setStatisticsServer(statisticsServer:string):void {
    this.statisticsServer = statisticsServer;
  }

  getStatisticsServer(): string | undefined{
    return this.statisticsServer;
  }

  private roomServer?: string;

  public setRoomServer(roomServer:string):void {
    this.roomServer = roomServer;
  }

  getRoomServer(): string | undefined{
    return this.roomServer;
  }

  private compatServer?: string;

  public setCompatServer(compatServer:string):void {
    this.compatServer = compatServer;
  }

  getCompatServer(): string | undefined{
    return this.compatServer;
  }

  private nosLbsServer?: string;

  public setNosLbsServer(nosLbsServer:string):void {
    this.nosLbsServer = nosLbsServer;
  }

  getNosLbsServer(): string | undefined{
    return this.nosLbsServer;
  }

  private nosUploadSever?: string;

  public setNosUploadSever(nosUploadSever:string):void {
    this.nosUploadSever = nosUploadSever;
  }

  getNosUploadSever(): string | undefined{
    return this.nosUploadSever;
  }

  private nosTokenServer?: string;

  public setNosTokenServer(nosTokenServer:string):void {
    this.nosTokenServer = nosTokenServer;
  }

  getNosTokenServer(): string | undefined{
    return this.nosTokenServer;
  }

  private sdkConfigServer?: string;

  public setSdkConfigServer(sdkConfigServer:string):void {
    this.sdkConfigServer = sdkConfigServer;
  }

  getSdkConfigServer(): string | undefined{
    return this.sdkConfigServer;
  }

  private cloudProxyServer?: string;

  public setCloudProxyServer(cloudProxyServer:string):void {
    this.cloudProxyServer = cloudProxyServer;
  }

  getCloudProxyServer(): string | undefined{
    return this.cloudProxyServer;
  }

  private webSocketProxyServer?: string;

  public setWebSocketProxyServer(webSocketProxyServer:string):void {
    this.webSocketProxyServer = webSocketProxyServer;
  }

  getWebSocketProxyServer(): string | undefined{
    return this.webSocketProxyServer;
  }

  private quicProxyServer?: string;

  public setQuicProxyServer(quicProxyServer:string):void {
    this.quicProxyServer = quicProxyServer;
  }

  getQuicProxyServer(): string | undefined{
    return this.quicProxyServer;
  }

  private mediaProxyServer?: string;

  public setMediaProxyServer(mediaProxyServer:string):void {
    this.mediaProxyServer = mediaProxyServer;
  }

  getMediaProxyServer(): string | undefined{
    return this.mediaProxyServer;
  }

  private statisticsDispatchServer?: string;

  public setStatisticsDispatchServer(statisticsDispatchServer:string):void {
    this.statisticsDispatchServer = statisticsDispatchServer;
  }

  getStatisticsDispatchServer(): string | undefined{
    return this.statisticsDispatchServer;
  }

  private statisticsBackupServer?: string;

  public setStatisticsBackupServer(statisticsBackupServer:string):void {
    this.statisticsBackupServer = statisticsBackupServer;
  }

  getStatisticsBackupServer(): string | undefined{
    return this.statisticsBackupServer;
  }

  private useIPv6?: boolean;

  public setUseIPv6(useIPv6:boolean):void {
    this.useIPv6 = useIPv6;
  }

  getUseIPv6(): boolean | undefined{
    return this.useIPv6;
  }

  constructor(valid?: boolean, channelServer?: string, statisticsServer?: string, roomServer?: string, compatServer?: string, nosLbsServer?: string, nosUploadSever?: string, nosTokenServer?: string, sdkConfigServer?: string, cloudProxyServer?: string, webSocketProxyServer?: string, quicProxyServer?: string, mediaProxyServer?: string, statisticsDispatchServer?: string, statisticsBackupServer?: string, useIPv6?: boolean) {
    this.valid = valid;
    this.channelServer = channelServer;
    this.statisticsServer = statisticsServer;
    this.roomServer = roomServer;
    this.compatServer = compatServer;
    this.nosLbsServer = nosLbsServer;
    this.nosUploadSever = nosUploadSever;
    this.nosTokenServer = nosTokenServer;
    this.sdkConfigServer = sdkConfigServer;
    this.cloudProxyServer = cloudProxyServer;
    this.webSocketProxyServer = webSocketProxyServer;
    this.quicProxyServer = quicProxyServer;
    this.mediaProxyServer = mediaProxyServer;
    this.statisticsDispatchServer = statisticsDispatchServer;
    this.statisticsBackupServer = statisticsBackupServer;
    this.useIPv6 = useIPv6;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.valid !==undefined){
      arr.push(this.valid);
    }
    if(this.channelServer !==undefined){
      arr.push(this.channelServer);
    }
    if(this.statisticsServer !==undefined){
      arr.push(this.statisticsServer);
    }
    if(this.roomServer !==undefined){
      arr.push(this.roomServer);
    }
    if(this.compatServer !==undefined){
      arr.push(this.compatServer);
    }
    if(this.nosLbsServer !==undefined){
      arr.push(this.nosLbsServer);
    }
    if(this.nosUploadSever !==undefined){
      arr.push(this.nosUploadSever);
    }
    if(this.nosTokenServer !==undefined){
      arr.push(this.nosTokenServer);
    }
    if(this.sdkConfigServer !==undefined){
      arr.push(this.sdkConfigServer);
    }
    if(this.cloudProxyServer !==undefined){
      arr.push(this.cloudProxyServer);
    }
    if(this.webSocketProxyServer !==undefined){
      arr.push(this.webSocketProxyServer);
    }
    if(this.quicProxyServer !==undefined){
      arr.push(this.quicProxyServer);
    }
    if(this.mediaProxyServer !==undefined){
      arr.push(this.mediaProxyServer);
    }
    if(this.statisticsDispatchServer !==undefined){
      arr.push(this.statisticsDispatchServer);
    }
    if(this.statisticsBackupServer !==undefined){
      arr.push(this.statisticsBackupServer);
    }
    if(this.useIPv6 !==undefined){
      arr.push(this.useIPv6);
    }
    return arr;
  }

  static fromList(arr: Object[]): RtcServerAddresses {
    let pigeonResult: RtcServerAddresses = new RtcServerAddresses();
    let valid: Object = arr[0];
    pigeonResult.setValid(valid as boolean);
    let channelServer: Object = arr[1];
    pigeonResult.setChannelServer(channelServer as string);
    let statisticsServer: Object = arr[2];
    pigeonResult.setStatisticsServer(statisticsServer as string);
    let roomServer: Object = arr[3];
    pigeonResult.setRoomServer(roomServer as string);
    let compatServer: Object = arr[4];
    pigeonResult.setCompatServer(compatServer as string);
    let nosLbsServer: Object = arr[5];
    pigeonResult.setNosLbsServer(nosLbsServer as string);
    let nosUploadSever: Object = arr[6];
    pigeonResult.setNosUploadSever(nosUploadSever as string);
    let nosTokenServer: Object = arr[7];
    pigeonResult.setNosTokenServer(nosTokenServer as string);
    let sdkConfigServer: Object = arr[8];
    pigeonResult.setSdkConfigServer(sdkConfigServer as string);
    let cloudProxyServer: Object = arr[9];
    pigeonResult.setCloudProxyServer(cloudProxyServer as string);
    let webSocketProxyServer: Object = arr[10];
    pigeonResult.setWebSocketProxyServer(webSocketProxyServer as string);
    let quicProxyServer: Object = arr[11];
    pigeonResult.setQuicProxyServer(quicProxyServer as string);
    let mediaProxyServer: Object = arr[12];
    pigeonResult.setMediaProxyServer(mediaProxyServer as string);
    let statisticsDispatchServer: Object = arr[13];
    pigeonResult.setStatisticsDispatchServer(statisticsDispatchServer as string);
    let statisticsBackupServer: Object = arr[14];
    pigeonResult.setStatisticsBackupServer(statisticsBackupServer as string);
    let useIPv6: Object = arr[15];
    pigeonResult.setUseIPv6(useIPv6 as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class CreateEngineRequest {
  private appKey?: string;

  public setAppKey(appKey:string):void {
    this.appKey = appKey;
  }

  getAppKey(): string | undefined{
    return this.appKey;
  }

  private logDir?: string;

  public setLogDir(logDir:string):void {
    this.logDir = logDir;
  }

  getLogDir(): string | undefined{
    return this.logDir;
  }

  private serverAddresses?: RtcServerAddresses;

  public setServerAddresses(serverAddresses:RtcServerAddresses):void {
    this.serverAddresses = serverAddresses;
  }

  getServerAddresses(): RtcServerAddresses | undefined{
    return this.serverAddresses;
  }

  private logLevel?: number;

  public setLogLevel(logLevel:number):void {
    this.logLevel = logLevel;
  }

  getLogLevel(): number | undefined{
    return this.logLevel;
  }

  private audioAutoSubscribe?: boolean;

  public setAudioAutoSubscribe(audioAutoSubscribe:boolean):void {
    this.audioAutoSubscribe = audioAutoSubscribe;
  }

  getAudioAutoSubscribe(): boolean | undefined{
    return this.audioAutoSubscribe;
  }

  private videoAutoSubscribe?: boolean;

  public setVideoAutoSubscribe(videoAutoSubscribe:boolean):void {
    this.videoAutoSubscribe = videoAutoSubscribe;
  }

  getVideoAutoSubscribe(): boolean | undefined{
    return this.videoAutoSubscribe;
  }

  private disableFirstJoinUserCreateChannel?: boolean;

  public setDisableFirstJoinUserCreateChannel(disableFirstJoinUserCreateChannel:boolean):void {
    this.disableFirstJoinUserCreateChannel = disableFirstJoinUserCreateChannel;
  }

  getDisableFirstJoinUserCreateChannel(): boolean | undefined{
    return this.disableFirstJoinUserCreateChannel;
  }

  private audioDisableOverrideSpeakerOnReceiver?: boolean;

  public setAudioDisableOverrideSpeakerOnReceiver(audioDisableOverrideSpeakerOnReceiver:boolean):void {
    this.audioDisableOverrideSpeakerOnReceiver = audioDisableOverrideSpeakerOnReceiver;
  }

  getAudioDisableOverrideSpeakerOnReceiver(): boolean | undefined{
    return this.audioDisableOverrideSpeakerOnReceiver;
  }

  private audioDisableSWAECOnHeadset?: boolean;

  public setAudioDisableSWAECOnHeadset(audioDisableSWAECOnHeadset:boolean):void {
    this.audioDisableSWAECOnHeadset = audioDisableSWAECOnHeadset;
  }

  getAudioDisableSWAECOnHeadset(): boolean | undefined{
    return this.audioDisableSWAECOnHeadset;
  }

  private audioAINSEnabled?: boolean;

  public setAudioAINSEnabled(audioAINSEnabled:boolean):void {
    this.audioAINSEnabled = audioAINSEnabled;
  }

  getAudioAINSEnabled(): boolean | undefined{
    return this.audioAINSEnabled;
  }

  private serverRecordAudio?: boolean;

  public setServerRecordAudio(serverRecordAudio:boolean):void {
    this.serverRecordAudio = serverRecordAudio;
  }

  getServerRecordAudio(): boolean | undefined{
    return this.serverRecordAudio;
  }

  private serverRecordVideo?: boolean;

  public setServerRecordVideo(serverRecordVideo:boolean):void {
    this.serverRecordVideo = serverRecordVideo;
  }

  getServerRecordVideo(): boolean | undefined{
    return this.serverRecordVideo;
  }

  private serverRecordMode?: number;

  public setServerRecordMode(serverRecordMode:number):void {
    this.serverRecordMode = serverRecordMode;
  }

  getServerRecordMode(): number | undefined{
    return this.serverRecordMode;
  }

  private serverRecordSpeaker?: boolean;

  public setServerRecordSpeaker(serverRecordSpeaker:boolean):void {
    this.serverRecordSpeaker = serverRecordSpeaker;
  }

  getServerRecordSpeaker(): boolean | undefined{
    return this.serverRecordSpeaker;
  }

  private publishSelfStream?: boolean;

  public setPublishSelfStream(publishSelfStream:boolean):void {
    this.publishSelfStream = publishSelfStream;
  }

  getPublishSelfStream(): boolean | undefined{
    return this.publishSelfStream;
  }

  private videoCaptureObserverEnabled?: boolean;

  public setVideoCaptureObserverEnabled(videoCaptureObserverEnabled:boolean):void {
    this.videoCaptureObserverEnabled = videoCaptureObserverEnabled;
  }

  getVideoCaptureObserverEnabled(): boolean | undefined{
    return this.videoCaptureObserverEnabled;
  }

  private videoEncodeMode?: number;

  public setVideoEncodeMode(videoEncodeMode:number):void {
    this.videoEncodeMode = videoEncodeMode;
  }

  getVideoEncodeMode(): number | undefined{
    return this.videoEncodeMode;
  }

  private videoDecodeMode?: number;

  public setVideoDecodeMode(videoDecodeMode:number):void {
    this.videoDecodeMode = videoDecodeMode;
  }

  getVideoDecodeMode(): number | undefined{
    return this.videoDecodeMode;
  }

  private videoSendMode?: number;

  public setVideoSendMode(videoSendMode:number):void {
    this.videoSendMode = videoSendMode;
  }

  getVideoSendMode(): number | undefined{
    return this.videoSendMode;
  }

  private videoH265Enabled?: boolean;

  public setVideoH265Enabled(videoH265Enabled:boolean):void {
    this.videoH265Enabled = videoH265Enabled;
  }

  getVideoH265Enabled(): boolean | undefined{
    return this.videoH265Enabled;
  }

  private mode1v1Enabled?: boolean;

  public setMode1v1Enabled(mode1v1Enabled:boolean):void {
    this.mode1v1Enabled = mode1v1Enabled;
  }

  getMode1v1Enabled(): boolean | undefined{
    return this.mode1v1Enabled;
  }

  private appGroup?: string;

  public setAppGroup(appGroup:string):void {
    this.appGroup = appGroup;
  }

  getAppGroup(): string | undefined{
    return this.appGroup;
  }

  constructor(appKey?: string, logDir?: string, serverAddresses?: RtcServerAddresses, logLevel?: number, audioAutoSubscribe?: boolean, videoAutoSubscribe?: boolean, disableFirstJoinUserCreateChannel?: boolean, audioDisableOverrideSpeakerOnReceiver?: boolean, audioDisableSWAECOnHeadset?: boolean, audioAINSEnabled?: boolean, serverRecordAudio?: boolean, serverRecordVideo?: boolean, serverRecordMode?: number, serverRecordSpeaker?: boolean, publishSelfStream?: boolean, videoCaptureObserverEnabled?: boolean, videoEncodeMode?: number, videoDecodeMode?: number, videoSendMode?: number, videoH265Enabled?: boolean, mode1v1Enabled?: boolean, appGroup?: string) {
    this.appKey = appKey;
    this.logDir = logDir;
    this.serverAddresses = serverAddresses;
    this.logLevel = logLevel;
    this.audioAutoSubscribe = audioAutoSubscribe;
    this.videoAutoSubscribe = videoAutoSubscribe;
    this.disableFirstJoinUserCreateChannel = disableFirstJoinUserCreateChannel;
    this.audioDisableOverrideSpeakerOnReceiver = audioDisableOverrideSpeakerOnReceiver;
    this.audioDisableSWAECOnHeadset = audioDisableSWAECOnHeadset;
    this.audioAINSEnabled = audioAINSEnabled;
    this.serverRecordAudio = serverRecordAudio;
    this.serverRecordVideo = serverRecordVideo;
    this.serverRecordMode = serverRecordMode;
    this.serverRecordSpeaker = serverRecordSpeaker;
    this.publishSelfStream = publishSelfStream;
    this.videoCaptureObserverEnabled = videoCaptureObserverEnabled;
    this.videoEncodeMode = videoEncodeMode;
    this.videoDecodeMode = videoDecodeMode;
    this.videoSendMode = videoSendMode;
    this.videoH265Enabled = videoH265Enabled;
    this.mode1v1Enabled = mode1v1Enabled;
    this.appGroup = appGroup;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.appKey !==undefined){
      arr.push(this.appKey);
    }
    if(this.logDir !==undefined){
      arr.push(this.logDir);
    }
    if(this.serverAddresses !==undefined){
      arr.push(this.serverAddresses);
    }
    if(this.logLevel !==undefined){
      arr.push(this.logLevel);
    }
    if(this.audioAutoSubscribe !==undefined){
      arr.push(this.audioAutoSubscribe);
    }
    if(this.videoAutoSubscribe !==undefined){
      arr.push(this.videoAutoSubscribe);
    }
    if(this.disableFirstJoinUserCreateChannel !==undefined){
      arr.push(this.disableFirstJoinUserCreateChannel);
    }
    if(this.audioDisableOverrideSpeakerOnReceiver !==undefined){
      arr.push(this.audioDisableOverrideSpeakerOnReceiver);
    }
    if(this.audioDisableSWAECOnHeadset !==undefined){
      arr.push(this.audioDisableSWAECOnHeadset);
    }
    if(this.audioAINSEnabled !==undefined){
      arr.push(this.audioAINSEnabled);
    }
    if(this.serverRecordAudio !==undefined){
      arr.push(this.serverRecordAudio);
    }
    if(this.serverRecordVideo !==undefined){
      arr.push(this.serverRecordVideo);
    }
    if(this.serverRecordMode !==undefined){
      arr.push(this.serverRecordMode);
    }
    if(this.serverRecordSpeaker !==undefined){
      arr.push(this.serverRecordSpeaker);
    }
    if(this.publishSelfStream !==undefined){
      arr.push(this.publishSelfStream);
    }
    if(this.videoCaptureObserverEnabled !==undefined){
      arr.push(this.videoCaptureObserverEnabled);
    }
    if(this.videoEncodeMode !==undefined){
      arr.push(this.videoEncodeMode);
    }
    if(this.videoDecodeMode !==undefined){
      arr.push(this.videoDecodeMode);
    }
    if(this.videoSendMode !==undefined){
      arr.push(this.videoSendMode);
    }
    if(this.videoH265Enabled !==undefined){
      arr.push(this.videoH265Enabled);
    }
    if(this.mode1v1Enabled !==undefined){
      arr.push(this.mode1v1Enabled);
    }
    if(this.appGroup !==undefined){
      arr.push(this.appGroup);
    }
    return arr;
  }

  static fromList(arr: Object[]): CreateEngineRequest {
    let pigeonResult: CreateEngineRequest = new CreateEngineRequest();
    let appKey: Object = arr[0];
    pigeonResult.setAppKey(appKey as string);
    let logDir: Object = arr[1];
    pigeonResult.setLogDir(logDir as string);
    let serverAddresses: Object = arr[2];
    pigeonResult.setServerAddresses(serverAddresses as RtcServerAddresses);
    let logLevel: Object = arr[3];
    pigeonResult.setLogLevel(logLevel as number);
    let audioAutoSubscribe: Object = arr[4];
    pigeonResult.setAudioAutoSubscribe(audioAutoSubscribe as boolean);
    let videoAutoSubscribe: Object = arr[5];
    pigeonResult.setVideoAutoSubscribe(videoAutoSubscribe as boolean);
    let disableFirstJoinUserCreateChannel: Object = arr[6];
    pigeonResult.setDisableFirstJoinUserCreateChannel(disableFirstJoinUserCreateChannel as boolean);
    let audioDisableOverrideSpeakerOnReceiver: Object = arr[7];
    pigeonResult.setAudioDisableOverrideSpeakerOnReceiver(audioDisableOverrideSpeakerOnReceiver as boolean);
    let audioDisableSWAECOnHeadset: Object = arr[8];
    pigeonResult.setAudioDisableSWAECOnHeadset(audioDisableSWAECOnHeadset as boolean);
    let audioAINSEnabled: Object = arr[9];
    pigeonResult.setAudioAINSEnabled(audioAINSEnabled as boolean);
    let serverRecordAudio: Object = arr[10];
    pigeonResult.setServerRecordAudio(serverRecordAudio as boolean);
    let serverRecordVideo: Object = arr[11];
    pigeonResult.setServerRecordVideo(serverRecordVideo as boolean);
    let serverRecordMode: Object = arr[12];
    pigeonResult.setServerRecordMode(serverRecordMode as number);
    let serverRecordSpeaker: Object = arr[13];
    pigeonResult.setServerRecordSpeaker(serverRecordSpeaker as boolean);
    let publishSelfStream: Object = arr[14];
    pigeonResult.setPublishSelfStream(publishSelfStream as boolean);
    let videoCaptureObserverEnabled: Object = arr[15];
    pigeonResult.setVideoCaptureObserverEnabled(videoCaptureObserverEnabled as boolean);
    let videoEncodeMode: Object = arr[16];
    pigeonResult.setVideoEncodeMode(videoEncodeMode as number);
    let videoDecodeMode: Object = arr[17];
    pigeonResult.setVideoDecodeMode(videoDecodeMode as number);
    let videoSendMode: Object = arr[18];
    pigeonResult.setVideoSendMode(videoSendMode as number);
    let videoH265Enabled: Object = arr[19];
    pigeonResult.setVideoH265Enabled(videoH265Enabled as boolean);
    let mode1v1Enabled: Object = arr[20];
    pigeonResult.setMode1v1Enabled(mode1v1Enabled as boolean);
    let appGroup: Object = arr[21];
    pigeonResult.setAppGroup(appGroup as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class JoinChannelOptions {
  private customInfo?: string;

  public setCustomInfo(customInfo:string):void {
    this.customInfo = customInfo;
  }

  getCustomInfo(): string | undefined{
    return this.customInfo;
  }

  private permissionKey?: string;

  public setPermissionKey(permissionKey:string):void {
    this.permissionKey = permissionKey;
  }

  getPermissionKey(): string | undefined{
    return this.permissionKey;
  }

  constructor(customInfo?: string, permissionKey?: string) {
    this.customInfo = customInfo;
    this.permissionKey = permissionKey;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.customInfo !==undefined){
      arr.push(this.customInfo);
    }
    if(this.permissionKey !==undefined){
      arr.push(this.permissionKey);
    }
    return arr;
  }

  static fromList(arr: Object[]): JoinChannelOptions {
    let pigeonResult: JoinChannelOptions = new JoinChannelOptions();
    let customInfo: Object = arr[0];
    pigeonResult.setCustomInfo(customInfo as string);
    let permissionKey: Object = arr[1];
    pigeonResult.setPermissionKey(permissionKey as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class JoinChannelRequest {
  private token?: string;

  public setToken(token:string):void {
    this.token = token;
  }

  getToken(): string | undefined{
    return this.token;
  }

  private channelName?: string;

  public setChannelName(channelName:string):void {
    this.channelName = channelName;
  }

  getChannelName(): string | undefined{
    return this.channelName;
  }

  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private channelOptions?: JoinChannelOptions;

  public setChannelOptions(channelOptions:JoinChannelOptions):void {
    this.channelOptions = channelOptions;
  }

  getChannelOptions(): JoinChannelOptions | undefined{
    return this.channelOptions;
  }

  constructor(token?: string, channelName?: string, uid?: number, channelOptions?: JoinChannelOptions) {
    this.token = token;
    this.channelName = channelName;
    this.uid = uid;
    this.channelOptions = channelOptions;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.token !==undefined){
      arr.push(this.token);
    }
    if(this.channelName !==undefined){
      arr.push(this.channelName);
    }
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.channelOptions !==undefined){
      arr.push(this.channelOptions);
    }
    return arr;
  }

  static fromList(arr: Object[]): JoinChannelRequest {
    let pigeonResult: JoinChannelRequest = new JoinChannelRequest();
    let token: Object = arr[0];
    pigeonResult.setToken(token as string);
    let channelName: Object = arr[1];
    pigeonResult.setChannelName(channelName as string);
    let uid: Object = arr[2];
    pigeonResult.setUid(uid as number);
    let channelOptions: Object = arr[3];
    pigeonResult.setChannelOptions(channelOptions as JoinChannelOptions);
    return pigeonResult;
  }
}

/*
*  LLM请求参数
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class NERtcLLMRequestParams {
  private taskId?: string;

  public setTaskId(taskId:string):void {
    this.taskId = taskId;
  }

  getTaskId(): string | undefined{
    return this.taskId;
  }

  private mediaContent?: string;

  public setMediaContent(mediaContent:string):void {
    this.mediaContent = mediaContent;
  }

  getMediaContent(): string | undefined{
    return this.mediaContent;
  }

  private url?: string;

  public setUrl(url:string):void {
    this.url = url;
  }

  getUrl(): string | undefined{
    return this.url;
  }

  private text?: string;

  public setText(text:string):void {
    this.text = text;
  }

  getText(): string | undefined{
    return this.text;
  }

  private interruptMode?: number;

  public setInterruptMode(interruptMode:number):void {
    this.interruptMode = interruptMode;
  }

  getInterruptMode(): number | undefined{
    return this.interruptMode;
  }

  constructor(taskId?: string, mediaContent?: string, url?: string, text?: string, interruptMode?: number) {
    this.taskId = taskId;
    this.mediaContent = mediaContent;
    this.url = url;
    this.text = text;
    this.interruptMode = interruptMode;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.taskId !==undefined){
      arr.push(this.taskId);
    }
    if(this.mediaContent !==undefined){
      arr.push(this.mediaContent);
    }
    if(this.url !==undefined){
      arr.push(this.url);
    }
    if(this.text !==undefined){
      arr.push(this.text);
    }
    if(this.interruptMode !==undefined){
      arr.push(this.interruptMode);
    }
    return arr;
  }

  static fromList(arr: Object[]): NERtcLLMRequestParams {
    let pigeonResult: NERtcLLMRequestParams = new NERtcLLMRequestParams();
    let taskId: Object = arr[0];
    pigeonResult.setTaskId(taskId as string);
    let mediaContent: Object = arr[1];
    pigeonResult.setMediaContent(mediaContent as string);
    let url: Object = arr[2];
    pigeonResult.setUrl(url as string);
    let text: Object = arr[3];
    pigeonResult.setText(text as string);
    let interruptMode: Object = arr[4];
    pigeonResult.setInterruptMode(interruptMode as number);
    return pigeonResult;
  }
}

/*
*  LLM请求结果
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class NERtcLLMRequestResult {
  private taskId?: string;

  public setTaskId(taskId:string):void {
    this.taskId = taskId;
  }

  getTaskId(): string | undefined{
    return this.taskId;
  }

  private code?: number;

  public setCode(code:number):void {
    this.code = code;
  }

  getCode(): number | undefined{
    return this.code;
  }

  private errorMsg?: string;

  public setErrorMsg(errorMsg:string):void {
    this.errorMsg = errorMsg;
  }

  getErrorMsg(): string | undefined{
    return this.errorMsg;
  }

  constructor(taskId?: string, code?: number, errorMsg?: string) {
    this.taskId = taskId;
    this.code = code;
    this.errorMsg = errorMsg;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.taskId !==undefined){
      arr.push(this.taskId);
    }
    if(this.code !==undefined){
      arr.push(this.code);
    }
    if(this.errorMsg !==undefined){
      arr.push(this.errorMsg);
    }
    return arr;
  }

  static fromList(arr: Object[]): NERtcLLMRequestResult {
    let pigeonResult: NERtcLLMRequestResult = new NERtcLLMRequestResult();
    let taskId: Object = arr[0];
    pigeonResult.setTaskId(taskId as string);
    let code: Object = arr[1];
    pigeonResult.setCode(code as number);
    let errorMsg: Object = arr[2];
    pigeonResult.setErrorMsg(errorMsg as string);
    return pigeonResult;
  }
}

/*
*  请求LLM的请求对象
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class RequestLLMRequest {
  private dstUid?: number;

  public setDstUid(dstUid:number):void {
    this.dstUid = dstUid;
  }

  getDstUid(): number | undefined{
    return this.dstUid;
  }

  private params?: NERtcLLMRequestParams;

  public setParams(params:NERtcLLMRequestParams):void {
    this.params = params;
  }

  getParams(): NERtcLLMRequestParams | undefined{
    return this.params;
  }

  constructor(dstUid?: number, params?: NERtcLLMRequestParams) {
    this.dstUid = dstUid;
    this.params = params;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.dstUid !==undefined){
      arr.push(this.dstUid);
    }
    if(this.params !==undefined){
      arr.push(this.params);
    }
    return arr;
  }

  static fromList(arr: Object[]): RequestLLMRequest {
    let pigeonResult: RequestLLMRequest = new RequestLLMRequest();
    let dstUid: Object = arr[0];
    pigeonResult.setDstUid(dstUid as number);
    let params: Object = arr[1];
    pigeonResult.setParams(params as NERtcLLMRequestParams);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SubscribeRemoteAudioRequest {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private subscribe?: boolean;

  public setSubscribe(subscribe:boolean):void {
    this.subscribe = subscribe;
  }

  getSubscribe(): boolean | undefined{
    return this.subscribe;
  }

  constructor(uid?: number, subscribe?: boolean) {
    this.uid = uid;
    this.subscribe = subscribe;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.subscribe !==undefined){
      arr.push(this.subscribe);
    }
    return arr;
  }

  static fromList(arr: Object[]): SubscribeRemoteAudioRequest {
    let pigeonResult: SubscribeRemoteAudioRequest = new SubscribeRemoteAudioRequest();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let subscribe: Object = arr[1];
    pigeonResult.setSubscribe(subscribe as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class EnableLocalVideoRequest {
  private enable?: boolean;

  public setEnable(enable:boolean):void {
    this.enable = enable;
  }

  getEnable(): boolean | undefined{
    return this.enable;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(enable?: boolean, streamType?: number) {
    this.enable = enable;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.enable !==undefined){
      arr.push(this.enable);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): EnableLocalVideoRequest {
    let pigeonResult: EnableLocalVideoRequest = new EnableLocalVideoRequest();
    let enable: Object = arr[0];
    pigeonResult.setEnable(enable as boolean);
    let streamType: Object = arr[1];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetAudioProfileRequest {
  private profile?: number;

  public setProfile(profile:number):void {
    this.profile = profile;
  }

  getProfile(): number | undefined{
    return this.profile;
  }

  private scenario?: number;

  public setScenario(scenario:number):void {
    this.scenario = scenario;
  }

  getScenario(): number | undefined{
    return this.scenario;
  }

  constructor(profile?: number, scenario?: number) {
    this.profile = profile;
    this.scenario = scenario;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.profile !==undefined){
      arr.push(this.profile);
    }
    if(this.scenario !==undefined){
      arr.push(this.scenario);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetAudioProfileRequest {
    let pigeonResult: SetAudioProfileRequest = new SetAudioProfileRequest();
    let profile: Object = arr[0];
    pigeonResult.setProfile(profile as number);
    let scenario: Object = arr[1];
    pigeonResult.setScenario(scenario as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetLocalVideoConfigRequest {
  private videoProfile?: number;

  public setVideoProfile(videoProfile:number):void {
    this.videoProfile = videoProfile;
  }

  getVideoProfile(): number | undefined{
    return this.videoProfile;
  }

  private videoCropMode?: number;

  public setVideoCropMode(videoCropMode:number):void {
    this.videoCropMode = videoCropMode;
  }

  getVideoCropMode(): number | undefined{
    return this.videoCropMode;
  }

  private frontCamera?: boolean;

  public setFrontCamera(frontCamera:boolean):void {
    this.frontCamera = frontCamera;
  }

  getFrontCamera(): boolean | undefined{
    return this.frontCamera;
  }

  private frameRate?: number;

  public setFrameRate(frameRate:number):void {
    this.frameRate = frameRate;
  }

  getFrameRate(): number | undefined{
    return this.frameRate;
  }

  private minFrameRate?: number;

  public setMinFrameRate(minFrameRate:number):void {
    this.minFrameRate = minFrameRate;
  }

  getMinFrameRate(): number | undefined{
    return this.minFrameRate;
  }

  private bitrate?: number;

  public setBitrate(bitrate:number):void {
    this.bitrate = bitrate;
  }

  getBitrate(): number | undefined{
    return this.bitrate;
  }

  private minBitrate?: number;

  public setMinBitrate(minBitrate:number):void {
    this.minBitrate = minBitrate;
  }

  getMinBitrate(): number | undefined{
    return this.minBitrate;
  }

  private degradationPrefer?: number;

  public setDegradationPrefer(degradationPrefer:number):void {
    this.degradationPrefer = degradationPrefer;
  }

  getDegradationPrefer(): number | undefined{
    return this.degradationPrefer;
  }

  private width?: number;

  public setWidth(width:number):void {
    this.width = width;
  }

  getWidth(): number | undefined{
    return this.width;
  }

  private height?: number;

  public setHeight(height:number):void {
    this.height = height;
  }

  getHeight(): number | undefined{
    return this.height;
  }

  private cameraType?: number;

  public setCameraType(cameraType:number):void {
    this.cameraType = cameraType;
  }

  getCameraType(): number | undefined{
    return this.cameraType;
  }

  private mirrorMode?: number;

  public setMirrorMode(mirrorMode:number):void {
    this.mirrorMode = mirrorMode;
  }

  getMirrorMode(): number | undefined{
    return this.mirrorMode;
  }

  private orientationMode?: number;

  public setOrientationMode(orientationMode:number):void {
    this.orientationMode = orientationMode;
  }

  getOrientationMode(): number | undefined{
    return this.orientationMode;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(videoProfile?: number, videoCropMode?: number, frontCamera?: boolean, frameRate?: number, minFrameRate?: number, bitrate?: number, minBitrate?: number, degradationPrefer?: number, width?: number, height?: number, cameraType?: number, mirrorMode?: number, orientationMode?: number, streamType?: number) {
    this.videoProfile = videoProfile;
    this.videoCropMode = videoCropMode;
    this.frontCamera = frontCamera;
    this.frameRate = frameRate;
    this.minFrameRate = minFrameRate;
    this.bitrate = bitrate;
    this.minBitrate = minBitrate;
    this.degradationPrefer = degradationPrefer;
    this.width = width;
    this.height = height;
    this.cameraType = cameraType;
    this.mirrorMode = mirrorMode;
    this.orientationMode = orientationMode;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.videoProfile !==undefined){
      arr.push(this.videoProfile);
    }
    if(this.videoCropMode !==undefined){
      arr.push(this.videoCropMode);
    }
    if(this.frontCamera !==undefined){
      arr.push(this.frontCamera);
    }
    if(this.frameRate !==undefined){
      arr.push(this.frameRate);
    }
    if(this.minFrameRate !==undefined){
      arr.push(this.minFrameRate);
    }
    if(this.bitrate !==undefined){
      arr.push(this.bitrate);
    }
    if(this.minBitrate !==undefined){
      arr.push(this.minBitrate);
    }
    if(this.degradationPrefer !==undefined){
      arr.push(this.degradationPrefer);
    }
    if(this.width !==undefined){
      arr.push(this.width);
    }
    if(this.height !==undefined){
      arr.push(this.height);
    }
    if(this.cameraType !==undefined){
      arr.push(this.cameraType);
    }
    if(this.mirrorMode !==undefined){
      arr.push(this.mirrorMode);
    }
    if(this.orientationMode !==undefined){
      arr.push(this.orientationMode);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetLocalVideoConfigRequest {
    let pigeonResult: SetLocalVideoConfigRequest = new SetLocalVideoConfigRequest();
    let videoProfile: Object = arr[0];
    pigeonResult.setVideoProfile(videoProfile as number);
    let videoCropMode: Object = arr[1];
    pigeonResult.setVideoCropMode(videoCropMode as number);
    let frontCamera: Object = arr[2];
    pigeonResult.setFrontCamera(frontCamera as boolean);
    let frameRate: Object = arr[3];
    pigeonResult.setFrameRate(frameRate as number);
    let minFrameRate: Object = arr[4];
    pigeonResult.setMinFrameRate(minFrameRate as number);
    let bitrate: Object = arr[5];
    pigeonResult.setBitrate(bitrate as number);
    let minBitrate: Object = arr[6];
    pigeonResult.setMinBitrate(minBitrate as number);
    let degradationPrefer: Object = arr[7];
    pigeonResult.setDegradationPrefer(degradationPrefer as number);
    let width: Object = arr[8];
    pigeonResult.setWidth(width as number);
    let height: Object = arr[9];
    pigeonResult.setHeight(height as number);
    let cameraType: Object = arr[10];
    pigeonResult.setCameraType(cameraType as number);
    let mirrorMode: Object = arr[11];
    pigeonResult.setMirrorMode(mirrorMode as number);
    let orientationMode: Object = arr[12];
    pigeonResult.setOrientationMode(orientationMode as number);
    let streamType: Object = arr[13];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/*
*  摄像头采集配置
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class SetCameraCaptureConfigRequest {
  private extraRotation?: NERtcCaptureExtraRotationEnum;

  public setExtraRotation(extraRotation:NERtcCaptureExtraRotationEnum):void {
    this.extraRotation = extraRotation;
  }

  getExtraRotation(): NERtcCaptureExtraRotationEnum | undefined{
    return this.extraRotation;
  }

  private captureWidth?: number;

  public setCaptureWidth(captureWidth:number):void {
    this.captureWidth = captureWidth;
  }

  getCaptureWidth(): number | undefined{
    return this.captureWidth;
  }

  private captureHeight?: number;

  public setCaptureHeight(captureHeight:number):void {
    this.captureHeight = captureHeight;
  }

  getCaptureHeight(): number | undefined{
    return this.captureHeight;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(extraRotation?: NERtcCaptureExtraRotationEnum, captureWidth?: number, captureHeight?: number, streamType?: number) {
    this.extraRotation = extraRotation;
    this.captureWidth = captureWidth;
    this.captureHeight = captureHeight;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.extraRotation !==undefined){
      arr.push(Object.values(NERtcCaptureExtraRotation).indexOf(this.extraRotation.index! as NERtcCaptureExtraRotation));
    }
    if(this.captureWidth !==undefined){
      arr.push(this.captureWidth);
    }
    if(this.captureHeight !==undefined){
      arr.push(this.captureHeight);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetCameraCaptureConfigRequest {
    let pigeonResult: SetCameraCaptureConfigRequest = new SetCameraCaptureConfigRequest();
    pigeonResult.setExtraRotation(new NERtcCaptureExtraRotationEnum(arr[0]! as number));
    let captureWidth: Object = arr[1];
    pigeonResult.setCaptureWidth(captureWidth as number);
    let captureHeight: Object = arr[2];
    pigeonResult.setCaptureHeight(captureHeight as number);
    let streamType: Object = arr[3];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartorStopVideoPreviewRequest {
  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(streamType?: number) {
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartorStopVideoPreviewRequest {
    let pigeonResult: StartorStopVideoPreviewRequest = new StartorStopVideoPreviewRequest();
    let streamType: Object = arr[0];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartScreenCaptureRequest {
  private contentPrefer?: number;

  public setContentPrefer(contentPrefer:number):void {
    this.contentPrefer = contentPrefer;
  }

  getContentPrefer(): number | undefined{
    return this.contentPrefer;
  }

  private videoProfile?: number;

  public setVideoProfile(videoProfile:number):void {
    this.videoProfile = videoProfile;
  }

  getVideoProfile(): number | undefined{
    return this.videoProfile;
  }

  private frameRate?: number;

  public setFrameRate(frameRate:number):void {
    this.frameRate = frameRate;
  }

  getFrameRate(): number | undefined{
    return this.frameRate;
  }

  private minFrameRate?: number;

  public setMinFrameRate(minFrameRate:number):void {
    this.minFrameRate = minFrameRate;
  }

  getMinFrameRate(): number | undefined{
    return this.minFrameRate;
  }

  private bitrate?: number;

  public setBitrate(bitrate:number):void {
    this.bitrate = bitrate;
  }

  getBitrate(): number | undefined{
    return this.bitrate;
  }

  private minBitrate?: number;

  public setMinBitrate(minBitrate:number):void {
    this.minBitrate = minBitrate;
  }

  getMinBitrate(): number | undefined{
    return this.minBitrate;
  }

  private dict?: Map<string, Object>;

  public setDict(dict:Map<string, Object>):void {
    this.dict = dict;
  }

  getDict(): Map<string, Object> | undefined{
    return this.dict;
  }

  constructor(contentPrefer?: number, videoProfile?: number, frameRate?: number, minFrameRate?: number, bitrate?: number, minBitrate?: number, dict?: Map<string, Object>) {
    this.contentPrefer = contentPrefer;
    this.videoProfile = videoProfile;
    this.frameRate = frameRate;
    this.minFrameRate = minFrameRate;
    this.bitrate = bitrate;
    this.minBitrate = minBitrate;
    this.dict = dict;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.contentPrefer !==undefined){
      arr.push(this.contentPrefer);
    }
    if(this.videoProfile !==undefined){
      arr.push(this.videoProfile);
    }
    if(this.frameRate !==undefined){
      arr.push(this.frameRate);
    }
    if(this.minFrameRate !==undefined){
      arr.push(this.minFrameRate);
    }
    if(this.bitrate !==undefined){
      arr.push(this.bitrate);
    }
    if(this.minBitrate !==undefined){
      arr.push(this.minBitrate);
    }
    if(this.dict !==undefined){
      arr.push(this.dict);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartScreenCaptureRequest {
    let pigeonResult: StartScreenCaptureRequest = new StartScreenCaptureRequest();
    let contentPrefer: Object = arr[0];
    pigeonResult.setContentPrefer(contentPrefer as number);
    let videoProfile: Object = arr[1];
    pigeonResult.setVideoProfile(videoProfile as number);
    let frameRate: Object = arr[2];
    pigeonResult.setFrameRate(frameRate as number);
    let minFrameRate: Object = arr[3];
    pigeonResult.setMinFrameRate(minFrameRate as number);
    let bitrate: Object = arr[4];
    pigeonResult.setBitrate(bitrate as number);
    let minBitrate: Object = arr[5];
    pigeonResult.setMinBitrate(minBitrate as number);
    let dict: Object = arr[6];
    pigeonResult.setDict(dict as Map<string, Object>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SubscribeRemoteVideoStreamRequest {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  private subscribe?: boolean;

  public setSubscribe(subscribe:boolean):void {
    this.subscribe = subscribe;
  }

  getSubscribe(): boolean | undefined{
    return this.subscribe;
  }

  constructor(uid?: number, streamType?: number, subscribe?: boolean) {
    this.uid = uid;
    this.streamType = streamType;
    this.subscribe = subscribe;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    if(this.subscribe !==undefined){
      arr.push(this.subscribe);
    }
    return arr;
  }

  static fromList(arr: Object[]): SubscribeRemoteVideoStreamRequest {
    let pigeonResult: SubscribeRemoteVideoStreamRequest = new SubscribeRemoteVideoStreamRequest();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let streamType: Object = arr[1];
    pigeonResult.setStreamType(streamType as number);
    let subscribe: Object = arr[2];
    pigeonResult.setSubscribe(subscribe as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SubscribeRemoteSubStreamVideoRequest {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private subscribe?: boolean;

  public setSubscribe(subscribe:boolean):void {
    this.subscribe = subscribe;
  }

  getSubscribe(): boolean | undefined{
    return this.subscribe;
  }

  constructor(uid?: number, subscribe?: boolean) {
    this.uid = uid;
    this.subscribe = subscribe;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.subscribe !==undefined){
      arr.push(this.subscribe);
    }
    return arr;
  }

  static fromList(arr: Object[]): SubscribeRemoteSubStreamVideoRequest {
    let pigeonResult: SubscribeRemoteSubStreamVideoRequest = new SubscribeRemoteSubStreamVideoRequest();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let subscribe: Object = arr[1];
    pigeonResult.setSubscribe(subscribe as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class EnableAudioVolumeIndicationRequest {
  private enable?: boolean;

  public setEnable(enable:boolean):void {
    this.enable = enable;
  }

  getEnable(): boolean | undefined{
    return this.enable;
  }

  private interval?: number;

  public setInterval(interval:number):void {
    this.interval = interval;
  }

  getInterval(): number | undefined{
    return this.interval;
  }

  private vad?: boolean;

  public setVad(vad:boolean):void {
    this.vad = vad;
  }

  getVad(): boolean | undefined{
    return this.vad;
  }

  constructor(enable?: boolean, interval?: number, vad?: boolean) {
    this.enable = enable;
    this.interval = interval;
    this.vad = vad;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.enable !==undefined){
      arr.push(this.enable);
    }
    if(this.interval !==undefined){
      arr.push(this.interval);
    }
    if(this.vad !==undefined){
      arr.push(this.vad);
    }
    return arr;
  }

  static fromList(arr: Object[]): EnableAudioVolumeIndicationRequest {
    let pigeonResult: EnableAudioVolumeIndicationRequest = new EnableAudioVolumeIndicationRequest();
    let enable: Object = arr[0];
    pigeonResult.setEnable(enable as boolean);
    let interval: Object = arr[1];
    pigeonResult.setInterval(interval as number);
    let vad: Object = arr[2];
    pigeonResult.setVad(vad as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SubscribeRemoteSubStreamAudioRequest {
  private subscribe?: boolean;

  public setSubscribe(subscribe:boolean):void {
    this.subscribe = subscribe;
  }

  getSubscribe(): boolean | undefined{
    return this.subscribe;
  }

  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  constructor(subscribe?: boolean, uid?: number) {
    this.subscribe = subscribe;
    this.uid = uid;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.subscribe !==undefined){
      arr.push(this.subscribe);
    }
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    return arr;
  }

  static fromList(arr: Object[]): SubscribeRemoteSubStreamAudioRequest {
    let pigeonResult: SubscribeRemoteSubStreamAudioRequest = new SubscribeRemoteSubStreamAudioRequest();
    let subscribe: Object = arr[0];
    pigeonResult.setSubscribe(subscribe as boolean);
    let uid: Object = arr[1];
    pigeonResult.setUid(uid as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetAudioSubscribeOnlyByRequest {
  private uidArray?: Array<number>;

  public setUidArray(uidArray:Array<number>):void {
    this.uidArray = uidArray;
  }

  getUidArray(): Array<number> | undefined{
    return this.uidArray;
  }

  constructor(uidArray?: Array<number>) {
    this.uidArray = uidArray;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uidArray !==undefined){
      arr.push(this.uidArray);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetAudioSubscribeOnlyByRequest {
    let pigeonResult: SetAudioSubscribeOnlyByRequest = new SetAudioSubscribeOnlyByRequest();
    let uidArray: Object = arr[0];
    pigeonResult.setUidArray(uidArray as Array<number>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartAudioMixingRequest {
  private path?: string;

  public setPath(path:string):void {
    this.path = path;
  }

  getPath(): string | undefined{
    return this.path;
  }

  private loopCount?: number;

  public setLoopCount(loopCount:number):void {
    this.loopCount = loopCount;
  }

  getLoopCount(): number | undefined{
    return this.loopCount;
  }

  private sendEnabled?: boolean;

  public setSendEnabled(sendEnabled:boolean):void {
    this.sendEnabled = sendEnabled;
  }

  getSendEnabled(): boolean | undefined{
    return this.sendEnabled;
  }

  private sendVolume?: number;

  public setSendVolume(sendVolume:number):void {
    this.sendVolume = sendVolume;
  }

  getSendVolume(): number | undefined{
    return this.sendVolume;
  }

  private playbackEnabled?: boolean;

  public setPlaybackEnabled(playbackEnabled:boolean):void {
    this.playbackEnabled = playbackEnabled;
  }

  getPlaybackEnabled(): boolean | undefined{
    return this.playbackEnabled;
  }

  private playbackVolume?: number;

  public setPlaybackVolume(playbackVolume:number):void {
    this.playbackVolume = playbackVolume;
  }

  getPlaybackVolume(): number | undefined{
    return this.playbackVolume;
  }

  private startTimeStamp?: number;

  public setStartTimeStamp(startTimeStamp:number):void {
    this.startTimeStamp = startTimeStamp;
  }

  getStartTimeStamp(): number | undefined{
    return this.startTimeStamp;
  }

  private sendWithAudioType?: number;

  public setSendWithAudioType(sendWithAudioType:number):void {
    this.sendWithAudioType = sendWithAudioType;
  }

  getSendWithAudioType(): number | undefined{
    return this.sendWithAudioType;
  }

  private progressInterval?: number;

  public setProgressInterval(progressInterval:number):void {
    this.progressInterval = progressInterval;
  }

  getProgressInterval(): number | undefined{
    return this.progressInterval;
  }

  constructor(path?: string, loopCount?: number, sendEnabled?: boolean, sendVolume?: number, playbackEnabled?: boolean, playbackVolume?: number, startTimeStamp?: number, sendWithAudioType?: number, progressInterval?: number) {
    this.path = path;
    this.loopCount = loopCount;
    this.sendEnabled = sendEnabled;
    this.sendVolume = sendVolume;
    this.playbackEnabled = playbackEnabled;
    this.playbackVolume = playbackVolume;
    this.startTimeStamp = startTimeStamp;
    this.sendWithAudioType = sendWithAudioType;
    this.progressInterval = progressInterval;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.path !==undefined){
      arr.push(this.path);
    }
    if(this.loopCount !==undefined){
      arr.push(this.loopCount);
    }
    if(this.sendEnabled !==undefined){
      arr.push(this.sendEnabled);
    }
    if(this.sendVolume !==undefined){
      arr.push(this.sendVolume);
    }
    if(this.playbackEnabled !==undefined){
      arr.push(this.playbackEnabled);
    }
    if(this.playbackVolume !==undefined){
      arr.push(this.playbackVolume);
    }
    if(this.startTimeStamp !==undefined){
      arr.push(this.startTimeStamp);
    }
    if(this.sendWithAudioType !==undefined){
      arr.push(this.sendWithAudioType);
    }
    if(this.progressInterval !==undefined){
      arr.push(this.progressInterval);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartAudioMixingRequest {
    let pigeonResult: StartAudioMixingRequest = new StartAudioMixingRequest();
    let path: Object = arr[0];
    pigeonResult.setPath(path as string);
    let loopCount: Object = arr[1];
    pigeonResult.setLoopCount(loopCount as number);
    let sendEnabled: Object = arr[2];
    pigeonResult.setSendEnabled(sendEnabled as boolean);
    let sendVolume: Object = arr[3];
    pigeonResult.setSendVolume(sendVolume as number);
    let playbackEnabled: Object = arr[4];
    pigeonResult.setPlaybackEnabled(playbackEnabled as boolean);
    let playbackVolume: Object = arr[5];
    pigeonResult.setPlaybackVolume(playbackVolume as number);
    let startTimeStamp: Object = arr[6];
    pigeonResult.setStartTimeStamp(startTimeStamp as number);
    let sendWithAudioType: Object = arr[7];
    pigeonResult.setSendWithAudioType(sendWithAudioType as number);
    let progressInterval: Object = arr[8];
    pigeonResult.setProgressInterval(progressInterval as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class PlayEffectRequest {
  private effectId?: number;

  public setEffectId(effectId:number):void {
    this.effectId = effectId;
  }

  getEffectId(): number | undefined{
    return this.effectId;
  }

  private path?: string;

  public setPath(path:string):void {
    this.path = path;
  }

  getPath(): string | undefined{
    return this.path;
  }

  private loopCount?: number;

  public setLoopCount(loopCount:number):void {
    this.loopCount = loopCount;
  }

  getLoopCount(): number | undefined{
    return this.loopCount;
  }

  private sendEnabled?: boolean;

  public setSendEnabled(sendEnabled:boolean):void {
    this.sendEnabled = sendEnabled;
  }

  getSendEnabled(): boolean | undefined{
    return this.sendEnabled;
  }

  private sendVolume?: number;

  public setSendVolume(sendVolume:number):void {
    this.sendVolume = sendVolume;
  }

  getSendVolume(): number | undefined{
    return this.sendVolume;
  }

  private playbackEnabled?: boolean;

  public setPlaybackEnabled(playbackEnabled:boolean):void {
    this.playbackEnabled = playbackEnabled;
  }

  getPlaybackEnabled(): boolean | undefined{
    return this.playbackEnabled;
  }

  private playbackVolume?: number;

  public setPlaybackVolume(playbackVolume:number):void {
    this.playbackVolume = playbackVolume;
  }

  getPlaybackVolume(): number | undefined{
    return this.playbackVolume;
  }

  private startTimestamp?: number;

  public setStartTimestamp(startTimestamp:number):void {
    this.startTimestamp = startTimestamp;
  }

  getStartTimestamp(): number | undefined{
    return this.startTimestamp;
  }

  private sendWithAudioType?: number;

  public setSendWithAudioType(sendWithAudioType:number):void {
    this.sendWithAudioType = sendWithAudioType;
  }

  getSendWithAudioType(): number | undefined{
    return this.sendWithAudioType;
  }

  private progressInterval?: number;

  public setProgressInterval(progressInterval:number):void {
    this.progressInterval = progressInterval;
  }

  getProgressInterval(): number | undefined{
    return this.progressInterval;
  }

  constructor(effectId?: number, path?: string, loopCount?: number, sendEnabled?: boolean, sendVolume?: number, playbackEnabled?: boolean, playbackVolume?: number, startTimestamp?: number, sendWithAudioType?: number, progressInterval?: number) {
    this.effectId = effectId;
    this.path = path;
    this.loopCount = loopCount;
    this.sendEnabled = sendEnabled;
    this.sendVolume = sendVolume;
    this.playbackEnabled = playbackEnabled;
    this.playbackVolume = playbackVolume;
    this.startTimestamp = startTimestamp;
    this.sendWithAudioType = sendWithAudioType;
    this.progressInterval = progressInterval;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.effectId !==undefined){
      arr.push(this.effectId);
    }
    if(this.path !==undefined){
      arr.push(this.path);
    }
    if(this.loopCount !==undefined){
      arr.push(this.loopCount);
    }
    if(this.sendEnabled !==undefined){
      arr.push(this.sendEnabled);
    }
    if(this.sendVolume !==undefined){
      arr.push(this.sendVolume);
    }
    if(this.playbackEnabled !==undefined){
      arr.push(this.playbackEnabled);
    }
    if(this.playbackVolume !==undefined){
      arr.push(this.playbackVolume);
    }
    if(this.startTimestamp !==undefined){
      arr.push(this.startTimestamp);
    }
    if(this.sendWithAudioType !==undefined){
      arr.push(this.sendWithAudioType);
    }
    if(this.progressInterval !==undefined){
      arr.push(this.progressInterval);
    }
    return arr;
  }

  static fromList(arr: Object[]): PlayEffectRequest {
    let pigeonResult: PlayEffectRequest = new PlayEffectRequest();
    let effectId: Object = arr[0];
    pigeonResult.setEffectId(effectId as number);
    let path: Object = arr[1];
    pigeonResult.setPath(path as string);
    let loopCount: Object = arr[2];
    pigeonResult.setLoopCount(loopCount as number);
    let sendEnabled: Object = arr[3];
    pigeonResult.setSendEnabled(sendEnabled as boolean);
    let sendVolume: Object = arr[4];
    pigeonResult.setSendVolume(sendVolume as number);
    let playbackEnabled: Object = arr[5];
    pigeonResult.setPlaybackEnabled(playbackEnabled as boolean);
    let playbackVolume: Object = arr[6];
    pigeonResult.setPlaybackVolume(playbackVolume as number);
    let startTimestamp: Object = arr[7];
    pigeonResult.setStartTimestamp(startTimestamp as number);
    let sendWithAudioType: Object = arr[8];
    pigeonResult.setSendWithAudioType(sendWithAudioType as number);
    let progressInterval: Object = arr[9];
    pigeonResult.setProgressInterval(progressInterval as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetCameraPositionRequest {
  private x?: number;

  public setX(x:number):void {
    this.x = x;
  }

  getX(): number | undefined{
    return this.x;
  }

  private y?: number;

  public setY(y:number):void {
    this.y = y;
  }

  getY(): number | undefined{
    return this.y;
  }

  constructor(x?: number, y?: number) {
    this.x = x;
    this.y = y;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.x !==undefined){
      arr.push(this.x);
    }
    if(this.y !==undefined){
      arr.push(this.y);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetCameraPositionRequest {
    let pigeonResult: SetCameraPositionRequest = new SetCameraPositionRequest();
    let x: Object = arr[0];
    pigeonResult.setX(x as number);
    let y: Object = arr[1];
    pigeonResult.setY(y as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AddOrUpdateLiveStreamTaskRequest {
  private serial?: number;

  public setSerial(serial:number):void {
    this.serial = serial;
  }

  getSerial(): number | undefined{
    return this.serial;
  }

  private taskId?: string;

  public setTaskId(taskId:string):void {
    this.taskId = taskId;
  }

  getTaskId(): string | undefined{
    return this.taskId;
  }

  private url?: string;

  public setUrl(url:string):void {
    this.url = url;
  }

  getUrl(): string | undefined{
    return this.url;
  }

  private serverRecordEnabled?: boolean;

  public setServerRecordEnabled(serverRecordEnabled:boolean):void {
    this.serverRecordEnabled = serverRecordEnabled;
  }

  getServerRecordEnabled(): boolean | undefined{
    return this.serverRecordEnabled;
  }

  private liveMode?: number;

  public setLiveMode(liveMode:number):void {
    this.liveMode = liveMode;
  }

  getLiveMode(): number | undefined{
    return this.liveMode;
  }

  private layoutWidth?: number;

  public setLayoutWidth(layoutWidth:number):void {
    this.layoutWidth = layoutWidth;
  }

  getLayoutWidth(): number | undefined{
    return this.layoutWidth;
  }

  private layoutHeight?: number;

  public setLayoutHeight(layoutHeight:number):void {
    this.layoutHeight = layoutHeight;
  }

  getLayoutHeight(): number | undefined{
    return this.layoutHeight;
  }

  private layoutBackgroundColor?: number;

  public setLayoutBackgroundColor(layoutBackgroundColor:number):void {
    this.layoutBackgroundColor = layoutBackgroundColor;
  }

  getLayoutBackgroundColor(): number | undefined{
    return this.layoutBackgroundColor;
  }

  private layoutImageUrl?: string;

  public setLayoutImageUrl(layoutImageUrl:string):void {
    this.layoutImageUrl = layoutImageUrl;
  }

  getLayoutImageUrl(): string | undefined{
    return this.layoutImageUrl;
  }

  private layoutImageX?: number;

  public setLayoutImageX(layoutImageX:number):void {
    this.layoutImageX = layoutImageX;
  }

  getLayoutImageX(): number | undefined{
    return this.layoutImageX;
  }

  private layoutImageY?: number;

  public setLayoutImageY(layoutImageY:number):void {
    this.layoutImageY = layoutImageY;
  }

  getLayoutImageY(): number | undefined{
    return this.layoutImageY;
  }

  private layoutImageWidth?: number;

  public setLayoutImageWidth(layoutImageWidth:number):void {
    this.layoutImageWidth = layoutImageWidth;
  }

  getLayoutImageWidth(): number | undefined{
    return this.layoutImageWidth;
  }

  private layoutImageHeight?: number;

  public setLayoutImageHeight(layoutImageHeight:number):void {
    this.layoutImageHeight = layoutImageHeight;
  }

  getLayoutImageHeight(): number | undefined{
    return this.layoutImageHeight;
  }

  private layoutUserTranscodingList?: Array<Object>;

  public setLayoutUserTranscodingList(layoutUserTranscodingList:Array<Object>):void {
    this.layoutUserTranscodingList = layoutUserTranscodingList;
  }

  getLayoutUserTranscodingList(): Array<Object> | undefined{
    return this.layoutUserTranscodingList;
  }

  constructor(serial?: number, taskId?: string, url?: string, serverRecordEnabled?: boolean, liveMode?: number, layoutWidth?: number, layoutHeight?: number, layoutBackgroundColor?: number, layoutImageUrl?: string, layoutImageX?: number, layoutImageY?: number, layoutImageWidth?: number, layoutImageHeight?: number, layoutUserTranscodingList?: Array<Object>) {
    this.serial = serial;
    this.taskId = taskId;
    this.url = url;
    this.serverRecordEnabled = serverRecordEnabled;
    this.liveMode = liveMode;
    this.layoutWidth = layoutWidth;
    this.layoutHeight = layoutHeight;
    this.layoutBackgroundColor = layoutBackgroundColor;
    this.layoutImageUrl = layoutImageUrl;
    this.layoutImageX = layoutImageX;
    this.layoutImageY = layoutImageY;
    this.layoutImageWidth = layoutImageWidth;
    this.layoutImageHeight = layoutImageHeight;
    this.layoutUserTranscodingList = layoutUserTranscodingList;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.serial !==undefined){
      arr.push(this.serial);
    }
    if(this.taskId !==undefined){
      arr.push(this.taskId);
    }
    if(this.url !==undefined){
      arr.push(this.url);
    }
    if(this.serverRecordEnabled !==undefined){
      arr.push(this.serverRecordEnabled);
    }
    if(this.liveMode !==undefined){
      arr.push(this.liveMode);
    }
    if(this.layoutWidth !==undefined){
      arr.push(this.layoutWidth);
    }
    if(this.layoutHeight !==undefined){
      arr.push(this.layoutHeight);
    }
    if(this.layoutBackgroundColor !==undefined){
      arr.push(this.layoutBackgroundColor);
    }
    if(this.layoutImageUrl !==undefined){
      arr.push(this.layoutImageUrl);
    }
    if(this.layoutImageX !==undefined){
      arr.push(this.layoutImageX);
    }
    if(this.layoutImageY !==undefined){
      arr.push(this.layoutImageY);
    }
    if(this.layoutImageWidth !==undefined){
      arr.push(this.layoutImageWidth);
    }
    if(this.layoutImageHeight !==undefined){
      arr.push(this.layoutImageHeight);
    }
    if(this.layoutUserTranscodingList !==undefined){
      arr.push(this.layoutUserTranscodingList);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddOrUpdateLiveStreamTaskRequest {
    let pigeonResult: AddOrUpdateLiveStreamTaskRequest = new AddOrUpdateLiveStreamTaskRequest();
    let serial: Object = arr[0];
    pigeonResult.setSerial(serial as number);
    let taskId: Object = arr[1];
    pigeonResult.setTaskId(taskId as string);
    let url: Object = arr[2];
    pigeonResult.setUrl(url as string);
    let serverRecordEnabled: Object = arr[3];
    pigeonResult.setServerRecordEnabled(serverRecordEnabled as boolean);
    let liveMode: Object = arr[4];
    pigeonResult.setLiveMode(liveMode as number);
    let layoutWidth: Object = arr[5];
    pigeonResult.setLayoutWidth(layoutWidth as number);
    let layoutHeight: Object = arr[6];
    pigeonResult.setLayoutHeight(layoutHeight as number);
    let layoutBackgroundColor: Object = arr[7];
    pigeonResult.setLayoutBackgroundColor(layoutBackgroundColor as number);
    let layoutImageUrl: Object = arr[8];
    pigeonResult.setLayoutImageUrl(layoutImageUrl as string);
    let layoutImageX: Object = arr[9];
    pigeonResult.setLayoutImageX(layoutImageX as number);
    let layoutImageY: Object = arr[10];
    pigeonResult.setLayoutImageY(layoutImageY as number);
    let layoutImageWidth: Object = arr[11];
    pigeonResult.setLayoutImageWidth(layoutImageWidth as number);
    let layoutImageHeight: Object = arr[12];
    pigeonResult.setLayoutImageHeight(layoutImageHeight as number);
    let layoutUserTranscodingList: Object = arr[13];
    pigeonResult.setLayoutUserTranscodingList(layoutUserTranscodingList as Array<Object>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class DeleteLiveStreamTaskRequest {
  private serial?: number;

  public setSerial(serial:number):void {
    this.serial = serial;
  }

  getSerial(): number | undefined{
    return this.serial;
  }

  private taskId?: string;

  public setTaskId(taskId:string):void {
    this.taskId = taskId;
  }

  getTaskId(): string | undefined{
    return this.taskId;
  }

  constructor(serial?: number, taskId?: string) {
    this.serial = serial;
    this.taskId = taskId;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.serial !==undefined){
      arr.push(this.serial);
    }
    if(this.taskId !==undefined){
      arr.push(this.taskId);
    }
    return arr;
  }

  static fromList(arr: Object[]): DeleteLiveStreamTaskRequest {
    let pigeonResult: DeleteLiveStreamTaskRequest = new DeleteLiveStreamTaskRequest();
    let serial: Object = arr[0];
    pigeonResult.setSerial(serial as number);
    let taskId: Object = arr[1];
    pigeonResult.setTaskId(taskId as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SendSEIMsgRequest {
  private seiMsg?: string;

  public setSeiMsg(seiMsg:string):void {
    this.seiMsg = seiMsg;
  }

  getSeiMsg(): string | undefined{
    return this.seiMsg;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(seiMsg?: string, streamType?: number) {
    this.seiMsg = seiMsg;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.seiMsg !==undefined){
      arr.push(this.seiMsg);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): SendSEIMsgRequest {
    let pigeonResult: SendSEIMsgRequest = new SendSEIMsgRequest();
    let seiMsg: Object = arr[0];
    pigeonResult.setSeiMsg(seiMsg as string);
    let streamType: Object = arr[1];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetLocalVoiceEqualizationRequest {
  private bandFrequency?: number;

  public setBandFrequency(bandFrequency:number):void {
    this.bandFrequency = bandFrequency;
  }

  getBandFrequency(): number | undefined{
    return this.bandFrequency;
  }

  private bandGain?: number;

  public setBandGain(bandGain:number):void {
    this.bandGain = bandGain;
  }

  getBandGain(): number | undefined{
    return this.bandGain;
  }

  constructor(bandFrequency?: number, bandGain?: number) {
    this.bandFrequency = bandFrequency;
    this.bandGain = bandGain;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.bandFrequency !==undefined){
      arr.push(this.bandFrequency);
    }
    if(this.bandGain !==undefined){
      arr.push(this.bandGain);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetLocalVoiceEqualizationRequest {
    let pigeonResult: SetLocalVoiceEqualizationRequest = new SetLocalVoiceEqualizationRequest();
    let bandFrequency: Object = arr[0];
    pigeonResult.setBandFrequency(bandFrequency as number);
    let bandGain: Object = arr[1];
    pigeonResult.setBandGain(bandGain as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SwitchChannelRequest {
  private token?: string;

  public setToken(token:string):void {
    this.token = token;
  }

  getToken(): string | undefined{
    return this.token;
  }

  private channelName?: string;

  public setChannelName(channelName:string):void {
    this.channelName = channelName;
  }

  getChannelName(): string | undefined{
    return this.channelName;
  }

  private channelOptions?: JoinChannelOptions;

  public setChannelOptions(channelOptions:JoinChannelOptions):void {
    this.channelOptions = channelOptions;
  }

  getChannelOptions(): JoinChannelOptions | undefined{
    return this.channelOptions;
  }

  constructor(token?: string, channelName?: string, channelOptions?: JoinChannelOptions) {
    this.token = token;
    this.channelName = channelName;
    this.channelOptions = channelOptions;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.token !==undefined){
      arr.push(this.token);
    }
    if(this.channelName !==undefined){
      arr.push(this.channelName);
    }
    if(this.channelOptions !==undefined){
      arr.push(this.channelOptions);
    }
    return arr;
  }

  static fromList(arr: Object[]): SwitchChannelRequest {
    let pigeonResult: SwitchChannelRequest = new SwitchChannelRequest();
    let token: Object = arr[0];
    pigeonResult.setToken(token as string);
    let channelName: Object = arr[1];
    pigeonResult.setChannelName(channelName as string);
    let channelOptions: Object = arr[2];
    pigeonResult.setChannelOptions(channelOptions as JoinChannelOptions);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartAudioRecordingRequest {
  private filePath?: string;

  public setFilePath(filePath:string):void {
    this.filePath = filePath;
  }

  getFilePath(): string | undefined{
    return this.filePath;
  }

  private sampleRate?: number;

  public setSampleRate(sampleRate:number):void {
    this.sampleRate = sampleRate;
  }

  getSampleRate(): number | undefined{
    return this.sampleRate;
  }

  private quality?: number;

  public setQuality(quality:number):void {
    this.quality = quality;
  }

  getQuality(): number | undefined{
    return this.quality;
  }

  constructor(filePath?: string, sampleRate?: number, quality?: number) {
    this.filePath = filePath;
    this.sampleRate = sampleRate;
    this.quality = quality;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.filePath !==undefined){
      arr.push(this.filePath);
    }
    if(this.sampleRate !==undefined){
      arr.push(this.sampleRate);
    }
    if(this.quality !==undefined){
      arr.push(this.quality);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartAudioRecordingRequest {
    let pigeonResult: StartAudioRecordingRequest = new StartAudioRecordingRequest();
    let filePath: Object = arr[0];
    pigeonResult.setFilePath(filePath as string);
    let sampleRate: Object = arr[1];
    pigeonResult.setSampleRate(sampleRate as number);
    let quality: Object = arr[2];
    pigeonResult.setQuality(quality as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AudioRecordingConfigurationRequest {
  private filePath?: string;

  public setFilePath(filePath:string):void {
    this.filePath = filePath;
  }

  getFilePath(): string | undefined{
    return this.filePath;
  }

  private sampleRate?: number;

  public setSampleRate(sampleRate:number):void {
    this.sampleRate = sampleRate;
  }

  getSampleRate(): number | undefined{
    return this.sampleRate;
  }

  private quality?: number;

  public setQuality(quality:number):void {
    this.quality = quality;
  }

  getQuality(): number | undefined{
    return this.quality;
  }

  private position?: number;

  public setPosition(position:number):void {
    this.position = position;
  }

  getPosition(): number | undefined{
    return this.position;
  }

  private cycleTime?: number;

  public setCycleTime(cycleTime:number):void {
    this.cycleTime = cycleTime;
  }

  getCycleTime(): number | undefined{
    return this.cycleTime;
  }

  constructor(filePath?: string, sampleRate?: number, quality?: number, position?: number, cycleTime?: number) {
    this.filePath = filePath;
    this.sampleRate = sampleRate;
    this.quality = quality;
    this.position = position;
    this.cycleTime = cycleTime;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.filePath !==undefined){
      arr.push(this.filePath);
    }
    if(this.sampleRate !==undefined){
      arr.push(this.sampleRate);
    }
    if(this.quality !==undefined){
      arr.push(this.quality);
    }
    if(this.position !==undefined){
      arr.push(this.position);
    }
    if(this.cycleTime !==undefined){
      arr.push(this.cycleTime);
    }
    return arr;
  }

  static fromList(arr: Object[]): AudioRecordingConfigurationRequest {
    let pigeonResult: AudioRecordingConfigurationRequest = new AudioRecordingConfigurationRequest();
    let filePath: Object = arr[0];
    pigeonResult.setFilePath(filePath as string);
    let sampleRate: Object = arr[1];
    pigeonResult.setSampleRate(sampleRate as number);
    let quality: Object = arr[2];
    pigeonResult.setQuality(quality as number);
    let position: Object = arr[3];
    pigeonResult.setPosition(position as number);
    let cycleTime: Object = arr[4];
    pigeonResult.setCycleTime(cycleTime as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetLocalMediaPriorityRequest {
  private priority?: number;

  public setPriority(priority:number):void {
    this.priority = priority;
  }

  getPriority(): number | undefined{
    return this.priority;
  }

  private isPreemptive?: boolean;

  public setIsPreemptive(isPreemptive:boolean):void {
    this.isPreemptive = isPreemptive;
  }

  getIsPreemptive(): boolean | undefined{
    return this.isPreemptive;
  }

  constructor(priority?: number, isPreemptive?: boolean) {
    this.priority = priority;
    this.isPreemptive = isPreemptive;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.priority !==undefined){
      arr.push(this.priority);
    }
    if(this.isPreemptive !==undefined){
      arr.push(this.isPreemptive);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetLocalMediaPriorityRequest {
    let pigeonResult: SetLocalMediaPriorityRequest = new SetLocalMediaPriorityRequest();
    let priority: Object = arr[0];
    pigeonResult.setPriority(priority as number);
    let isPreemptive: Object = arr[1];
    pigeonResult.setIsPreemptive(isPreemptive as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartOrUpdateChannelMediaRelayRequest {
  private sourceMediaInfo?: Map<Object, Object>;

  public setSourceMediaInfo(sourceMediaInfo:Map<Object, Object>):void {
    this.sourceMediaInfo = sourceMediaInfo;
  }

  getSourceMediaInfo(): Map<Object, Object> | undefined{
    return this.sourceMediaInfo;
  }

  private destMediaInfo?: Map<Object, Map<Object, Object>>;

  public setDestMediaInfo(destMediaInfo:Map<Object, Map<Object, Object>>):void {
    this.destMediaInfo = destMediaInfo;
  }

  getDestMediaInfo(): Map<Object, Map<Object, Object>> | undefined{
    return this.destMediaInfo;
  }

  constructor(sourceMediaInfo?: Map<Object, Object>, destMediaInfo?: Map<Object, Map<Object, Object>>) {
    this.sourceMediaInfo = sourceMediaInfo;
    this.destMediaInfo = destMediaInfo;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.sourceMediaInfo !==undefined){
      arr.push(this.sourceMediaInfo);
    }
    if(this.destMediaInfo !==undefined){
      arr.push(this.destMediaInfo);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartOrUpdateChannelMediaRelayRequest {
    let pigeonResult: StartOrUpdateChannelMediaRelayRequest = new StartOrUpdateChannelMediaRelayRequest();
    let sourceMediaInfo: Object = arr[0];
    pigeonResult.setSourceMediaInfo(sourceMediaInfo as Map<Object, Object>);
    let destMediaInfo: Object = arr[1];
    pigeonResult.setDestMediaInfo(destMediaInfo as Map<Object, Map<Object, Object>>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AdjustUserPlaybackSignalVolumeRequest {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private volume?: number;

  public setVolume(volume:number):void {
    this.volume = volume;
  }

  getVolume(): number | undefined{
    return this.volume;
  }

  constructor(uid?: number, volume?: number) {
    this.uid = uid;
    this.volume = volume;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.volume !==undefined){
      arr.push(this.volume);
    }
    return arr;
  }

  static fromList(arr: Object[]): AdjustUserPlaybackSignalVolumeRequest {
    let pigeonResult: AdjustUserPlaybackSignalVolumeRequest = new AdjustUserPlaybackSignalVolumeRequest();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let volume: Object = arr[1];
    pigeonResult.setVolume(volume as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class EnableEncryptionRequest {
  private key?: string;

  public setKey(key:string):void {
    this.key = key;
  }

  getKey(): string | undefined{
    return this.key;
  }

  private mode?: number;

  public setMode(mode:number):void {
    this.mode = mode;
  }

  getMode(): number | undefined{
    return this.mode;
  }

  private enable?: boolean;

  public setEnable(enable:boolean):void {
    this.enable = enable;
  }

  getEnable(): boolean | undefined{
    return this.enable;
  }

  constructor(key?: string, mode?: number, enable?: boolean) {
    this.key = key;
    this.mode = mode;
    this.enable = enable;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.key !==undefined){
      arr.push(this.key);
    }
    if(this.mode !==undefined){
      arr.push(this.mode);
    }
    if(this.enable !==undefined){
      arr.push(this.enable);
    }
    return arr;
  }

  static fromList(arr: Object[]): EnableEncryptionRequest {
    let pigeonResult: EnableEncryptionRequest = new EnableEncryptionRequest();
    let key: Object = arr[0];
    pigeonResult.setKey(key as string);
    let mode: Object = arr[1];
    pigeonResult.setMode(mode as number);
    let enable: Object = arr[2];
    pigeonResult.setEnable(enable as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetLocalVoiceReverbParamRequest {
  private wetGain?: number;

  public setWetGain(wetGain:number):void {
    this.wetGain = wetGain;
  }

  getWetGain(): number | undefined{
    return this.wetGain;
  }

  private dryGain?: number;

  public setDryGain(dryGain:number):void {
    this.dryGain = dryGain;
  }

  getDryGain(): number | undefined{
    return this.dryGain;
  }

  private damping?: number;

  public setDamping(damping:number):void {
    this.damping = damping;
  }

  getDamping(): number | undefined{
    return this.damping;
  }

  private roomSize?: number;

  public setRoomSize(roomSize:number):void {
    this.roomSize = roomSize;
  }

  getRoomSize(): number | undefined{
    return this.roomSize;
  }

  private decayTime?: number;

  public setDecayTime(decayTime:number):void {
    this.decayTime = decayTime;
  }

  getDecayTime(): number | undefined{
    return this.decayTime;
  }

  private preDelay?: number;

  public setPreDelay(preDelay:number):void {
    this.preDelay = preDelay;
  }

  getPreDelay(): number | undefined{
    return this.preDelay;
  }

  constructor(wetGain?: number, dryGain?: number, damping?: number, roomSize?: number, decayTime?: number, preDelay?: number) {
    this.wetGain = wetGain;
    this.dryGain = dryGain;
    this.damping = damping;
    this.roomSize = roomSize;
    this.decayTime = decayTime;
    this.preDelay = preDelay;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.wetGain !==undefined){
      arr.push(this.wetGain);
    }
    if(this.dryGain !==undefined){
      arr.push(this.dryGain);
    }
    if(this.damping !==undefined){
      arr.push(this.damping);
    }
    if(this.roomSize !==undefined){
      arr.push(this.roomSize);
    }
    if(this.decayTime !==undefined){
      arr.push(this.decayTime);
    }
    if(this.preDelay !==undefined){
      arr.push(this.preDelay);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetLocalVoiceReverbParamRequest {
    let pigeonResult: SetLocalVoiceReverbParamRequest = new SetLocalVoiceReverbParamRequest();
    let wetGain: Object = arr[0];
    pigeonResult.setWetGain(wetGain as number);
    let dryGain: Object = arr[1];
    pigeonResult.setDryGain(dryGain as number);
    let damping: Object = arr[2];
    pigeonResult.setDamping(damping as number);
    let roomSize: Object = arr[3];
    pigeonResult.setRoomSize(roomSize as number);
    let decayTime: Object = arr[4];
    pigeonResult.setDecayTime(decayTime as number);
    let preDelay: Object = arr[5];
    pigeonResult.setPreDelay(preDelay as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class ReportCustomEventRequest {
  private eventName?: string;

  public setEventName(eventName:string):void {
    this.eventName = eventName;
  }

  getEventName(): string | undefined{
    return this.eventName;
  }

  private customIdentify?: string;

  public setCustomIdentify(customIdentify:string):void {
    this.customIdentify = customIdentify;
  }

  getCustomIdentify(): string | undefined{
    return this.customIdentify;
  }

  private param?: Map<string, Object>;

  public setParam(param:Map<string, Object>):void {
    this.param = param;
  }

  getParam(): Map<string, Object> | undefined{
    return this.param;
  }

  constructor(eventName?: string, customIdentify?: string, param?: Map<string, Object>) {
    this.eventName = eventName;
    this.customIdentify = customIdentify;
    this.param = param;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.eventName !==undefined){
      arr.push(this.eventName);
    }
    if(this.customIdentify !==undefined){
      arr.push(this.customIdentify);
    }
    if(this.param !==undefined){
      arr.push(this.param);
    }
    return arr;
  }

  static fromList(arr: Object[]): ReportCustomEventRequest {
    let pigeonResult: ReportCustomEventRequest = new ReportCustomEventRequest();
    let eventName: Object = arr[0];
    pigeonResult.setEventName(eventName as string);
    let customIdentify: Object = arr[1];
    pigeonResult.setCustomIdentify(customIdentify as string);
    let param: Object = arr[2];
    pigeonResult.setParam(param as Map<string, Object>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartLastmileProbeTestRequest {
  private probeUplink?: boolean;

  public setProbeUplink(probeUplink:boolean):void {
    this.probeUplink = probeUplink;
  }

  getProbeUplink(): boolean | undefined{
    return this.probeUplink;
  }

  private probeDownlink?: boolean;

  public setProbeDownlink(probeDownlink:boolean):void {
    this.probeDownlink = probeDownlink;
  }

  getProbeDownlink(): boolean | undefined{
    return this.probeDownlink;
  }

  private expectedUplinkBitrate?: number;

  public setExpectedUplinkBitrate(expectedUplinkBitrate:number):void {
    this.expectedUplinkBitrate = expectedUplinkBitrate;
  }

  getExpectedUplinkBitrate(): number | undefined{
    return this.expectedUplinkBitrate;
  }

  private expectedDownlinkBitrate?: number;

  public setExpectedDownlinkBitrate(expectedDownlinkBitrate:number):void {
    this.expectedDownlinkBitrate = expectedDownlinkBitrate;
  }

  getExpectedDownlinkBitrate(): number | undefined{
    return this.expectedDownlinkBitrate;
  }

  constructor(probeUplink?: boolean, probeDownlink?: boolean, expectedUplinkBitrate?: number, expectedDownlinkBitrate?: number) {
    this.probeUplink = probeUplink;
    this.probeDownlink = probeDownlink;
    this.expectedUplinkBitrate = expectedUplinkBitrate;
    this.expectedDownlinkBitrate = expectedDownlinkBitrate;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.probeUplink !==undefined){
      arr.push(this.probeUplink);
    }
    if(this.probeDownlink !==undefined){
      arr.push(this.probeDownlink);
    }
    if(this.expectedUplinkBitrate !==undefined){
      arr.push(this.expectedUplinkBitrate);
    }
    if(this.expectedDownlinkBitrate !==undefined){
      arr.push(this.expectedDownlinkBitrate);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartLastmileProbeTestRequest {
    let pigeonResult: StartLastmileProbeTestRequest = new StartLastmileProbeTestRequest();
    let probeUplink: Object = arr[0];
    pigeonResult.setProbeUplink(probeUplink as boolean);
    let probeDownlink: Object = arr[1];
    pigeonResult.setProbeDownlink(probeDownlink as boolean);
    let expectedUplinkBitrate: Object = arr[2];
    pigeonResult.setExpectedUplinkBitrate(expectedUplinkBitrate as number);
    let expectedDownlinkBitrate: Object = arr[3];
    pigeonResult.setExpectedDownlinkBitrate(expectedDownlinkBitrate as number);
    return pigeonResult;
  }
}

/*
*  顶点坐标
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class CGPoint {
  private x?: number;

  public setX(x:number):void {
    this.x = x;
  }

  getX(): number | undefined{
    return this.x;
  }

  private y?: number;

  public setY(y:number):void {
    this.y = y;
  }

  getY(): number | undefined{
    return this.y;
  }

  constructor(x?: number, y?: number) {
    this.x = x;
    this.y = y;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.x !==undefined){
      arr.push(this.x);
    }
    if(this.y !==undefined){
      arr.push(this.y);
    }
    return arr;
  }

  static fromList(arr: Object[]): CGPoint {
    let pigeonResult: CGPoint = new CGPoint();
    let x: Object = arr[0];
    pigeonResult.setX(x as number);
    let y: Object = arr[1];
    pigeonResult.setY(y as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetVideoCorrectionConfigRequest {
  private topLeft?: CGPoint;

  public setTopLeft(topLeft:CGPoint):void {
    this.topLeft = topLeft;
  }

  getTopLeft(): CGPoint | undefined{
    return this.topLeft;
  }

  private topRight?: CGPoint;

  public setTopRight(topRight:CGPoint):void {
    this.topRight = topRight;
  }

  getTopRight(): CGPoint | undefined{
    return this.topRight;
  }

  private bottomLeft?: CGPoint;

  public setBottomLeft(bottomLeft:CGPoint):void {
    this.bottomLeft = bottomLeft;
  }

  getBottomLeft(): CGPoint | undefined{
    return this.bottomLeft;
  }

  private bottomRight?: CGPoint;

  public setBottomRight(bottomRight:CGPoint):void {
    this.bottomRight = bottomRight;
  }

  getBottomRight(): CGPoint | undefined{
    return this.bottomRight;
  }

  private canvasWidth?: number;

  public setCanvasWidth(canvasWidth:number):void {
    this.canvasWidth = canvasWidth;
  }

  getCanvasWidth(): number | undefined{
    return this.canvasWidth;
  }

  private canvasHeight?: number;

  public setCanvasHeight(canvasHeight:number):void {
    this.canvasHeight = canvasHeight;
  }

  getCanvasHeight(): number | undefined{
    return this.canvasHeight;
  }

  private enableMirror?: boolean;

  public setEnableMirror(enableMirror:boolean):void {
    this.enableMirror = enableMirror;
  }

  getEnableMirror(): boolean | undefined{
    return this.enableMirror;
  }

  constructor(topLeft?: CGPoint, topRight?: CGPoint, bottomLeft?: CGPoint, bottomRight?: CGPoint, canvasWidth?: number, canvasHeight?: number, enableMirror?: boolean) {
    this.topLeft = topLeft;
    this.topRight = topRight;
    this.bottomLeft = bottomLeft;
    this.bottomRight = bottomRight;
    this.canvasWidth = canvasWidth;
    this.canvasHeight = canvasHeight;
    this.enableMirror = enableMirror;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.topLeft !==undefined){
      arr.push(this.topLeft);
    }
    if(this.topRight !==undefined){
      arr.push(this.topRight);
    }
    if(this.bottomLeft !==undefined){
      arr.push(this.bottomLeft);
    }
    if(this.bottomRight !==undefined){
      arr.push(this.bottomRight);
    }
    if(this.canvasWidth !==undefined){
      arr.push(this.canvasWidth);
    }
    if(this.canvasHeight !==undefined){
      arr.push(this.canvasHeight);
    }
    if(this.enableMirror !==undefined){
      arr.push(this.enableMirror);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetVideoCorrectionConfigRequest {
    let pigeonResult: SetVideoCorrectionConfigRequest = new SetVideoCorrectionConfigRequest();
    let topLeft: Object = arr[0];
    pigeonResult.setTopLeft(topLeft as CGPoint);
    let topRight: Object = arr[1];
    pigeonResult.setTopRight(topRight as CGPoint);
    let bottomLeft: Object = arr[2];
    pigeonResult.setBottomLeft(bottomLeft as CGPoint);
    let bottomRight: Object = arr[3];
    pigeonResult.setBottomRight(bottomRight as CGPoint);
    let canvasWidth: Object = arr[4];
    pigeonResult.setCanvasWidth(canvasWidth as number);
    let canvasHeight: Object = arr[5];
    pigeonResult.setCanvasHeight(canvasHeight as number);
    let enableMirror: Object = arr[6];
    pigeonResult.setEnableMirror(enableMirror as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class EnableVirtualBackgroundRequest {
  private enabled?: boolean;

  public setEnabled(enabled:boolean):void {
    this.enabled = enabled;
  }

  getEnabled(): boolean | undefined{
    return this.enabled;
  }

  private backgroundSourceType?: number;

  public setBackgroundSourceType(backgroundSourceType:number):void {
    this.backgroundSourceType = backgroundSourceType;
  }

  getBackgroundSourceType(): number | undefined{
    return this.backgroundSourceType;
  }

  private color?: number;

  public setColor(color:number):void {
    this.color = color;
  }

  getColor(): number | undefined{
    return this.color;
  }

  private source?: string;

  public setSource(source:string):void {
    this.source = source;
  }

  getSource(): string | undefined{
    return this.source;
  }

  private blur_degree?: number;

  public setBlur_degree(blur_degree:number):void {
    this.blur_degree = blur_degree;
  }

  getBlur_degree(): number | undefined{
    return this.blur_degree;
  }

  constructor(enabled?: boolean, backgroundSourceType?: number, color?: number, source?: string, blur_degree?: number) {
    this.enabled = enabled;
    this.backgroundSourceType = backgroundSourceType;
    this.color = color;
    this.source = source;
    this.blur_degree = blur_degree;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.enabled !==undefined){
      arr.push(this.enabled);
    }
    if(this.backgroundSourceType !==undefined){
      arr.push(this.backgroundSourceType);
    }
    if(this.color !==undefined){
      arr.push(this.color);
    }
    if(this.source !==undefined){
      arr.push(this.source);
    }
    if(this.blur_degree !==undefined){
      arr.push(this.blur_degree);
    }
    return arr;
  }

  static fromList(arr: Object[]): EnableVirtualBackgroundRequest {
    let pigeonResult: EnableVirtualBackgroundRequest = new EnableVirtualBackgroundRequest();
    let enabled: Object = arr[0];
    pigeonResult.setEnabled(enabled as boolean);
    let backgroundSourceType: Object = arr[1];
    pigeonResult.setBackgroundSourceType(backgroundSourceType as number);
    let color: Object = arr[2];
    pigeonResult.setColor(color as number);
    let source: Object = arr[3];
    pigeonResult.setSource(source as string);
    let blur_degree: Object = arr[4];
    pigeonResult.setBlur_degree(blur_degree as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetRemoteHighPriorityAudioStreamRequest {
  private enabled?: boolean;

  public setEnabled(enabled:boolean):void {
    this.enabled = enabled;
  }

  getEnabled(): boolean | undefined{
    return this.enabled;
  }

  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  constructor(enabled?: boolean, uid?: number, streamType?: number) {
    this.enabled = enabled;
    this.uid = uid;
    this.streamType = streamType;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.enabled !==undefined){
      arr.push(this.enabled);
    }
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetRemoteHighPriorityAudioStreamRequest {
    let pigeonResult: SetRemoteHighPriorityAudioStreamRequest = new SetRemoteHighPriorityAudioStreamRequest();
    let enabled: Object = arr[0];
    pigeonResult.setEnabled(enabled as boolean);
    let uid: Object = arr[1];
    pigeonResult.setUid(uid as number);
    let streamType: Object = arr[2];
    pigeonResult.setStreamType(streamType as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class VideoWatermarkImageConfig {
  private wmAlpha?: number;

  public setWmAlpha(wmAlpha:number):void {
    this.wmAlpha = wmAlpha;
  }

  getWmAlpha(): number | undefined{
    return this.wmAlpha;
  }

  private wmWidth?: number;

  public setWmWidth(wmWidth:number):void {
    this.wmWidth = wmWidth;
  }

  getWmWidth(): number | undefined{
    return this.wmWidth;
  }

  private wmHeight?: number;

  public setWmHeight(wmHeight:number):void {
    this.wmHeight = wmHeight;
  }

  getWmHeight(): number | undefined{
    return this.wmHeight;
  }

  private offsetX?: number;

  public setOffsetX(offsetX:number):void {
    this.offsetX = offsetX;
  }

  getOffsetX(): number | undefined{
    return this.offsetX;
  }

  private offsetY?: number;

  public setOffsetY(offsetY:number):void {
    this.offsetY = offsetY;
  }

  getOffsetY(): number | undefined{
    return this.offsetY;
  }

  private imagePaths?: Array<string>;

  public setImagePaths(imagePaths:Array<string>):void {
    this.imagePaths = imagePaths;
  }

  getImagePaths(): Array<string> | undefined{
    return this.imagePaths;
  }

  private fps?: number;

  public setFps(fps:number):void {
    this.fps = fps;
  }

  getFps(): number | undefined{
    return this.fps;
  }

  private loop?: boolean;

  public setLoop(loop:boolean):void {
    this.loop = loop;
  }

  getLoop(): boolean | undefined{
    return this.loop;
  }

  constructor(wmAlpha?: number, wmWidth?: number, wmHeight?: number, offsetX?: number, offsetY?: number, imagePaths?: Array<string>, fps?: number, loop?: boolean) {
    this.wmAlpha = wmAlpha;
    this.wmWidth = wmWidth;
    this.wmHeight = wmHeight;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.imagePaths = imagePaths;
    this.fps = fps;
    this.loop = loop;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.wmAlpha !==undefined){
      arr.push(this.wmAlpha);
    }
    if(this.wmWidth !==undefined){
      arr.push(this.wmWidth);
    }
    if(this.wmHeight !==undefined){
      arr.push(this.wmHeight);
    }
    if(this.offsetX !==undefined){
      arr.push(this.offsetX);
    }
    if(this.offsetY !==undefined){
      arr.push(this.offsetY);
    }
    if(this.imagePaths !==undefined){
      arr.push(this.imagePaths);
    }
    if(this.fps !==undefined){
      arr.push(this.fps);
    }
    if(this.loop !==undefined){
      arr.push(this.loop);
    }
    return arr;
  }

  static fromList(arr: Object[]): VideoWatermarkImageConfig {
    let pigeonResult: VideoWatermarkImageConfig = new VideoWatermarkImageConfig();
    let wmAlpha: Object = arr[0];
    pigeonResult.setWmAlpha(wmAlpha as number);
    let wmWidth: Object = arr[1];
    pigeonResult.setWmWidth(wmWidth as number);
    let wmHeight: Object = arr[2];
    pigeonResult.setWmHeight(wmHeight as number);
    let offsetX: Object = arr[3];
    pigeonResult.setOffsetX(offsetX as number);
    let offsetY: Object = arr[4];
    pigeonResult.setOffsetY(offsetY as number);
    let imagePaths: Object = arr[5];
    pigeonResult.setImagePaths(imagePaths as Array<string>);
    let fps: Object = arr[6];
    pigeonResult.setFps(fps as number);
    let loop: Object = arr[7];
    pigeonResult.setLoop(loop as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class VideoWatermarkTextConfig {
  private wmAlpha?: number;

  public setWmAlpha(wmAlpha:number):void {
    this.wmAlpha = wmAlpha;
  }

  getWmAlpha(): number | undefined{
    return this.wmAlpha;
  }

  private wmWidth?: number;

  public setWmWidth(wmWidth:number):void {
    this.wmWidth = wmWidth;
  }

  getWmWidth(): number | undefined{
    return this.wmWidth;
  }

  private wmHeight?: number;

  public setWmHeight(wmHeight:number):void {
    this.wmHeight = wmHeight;
  }

  getWmHeight(): number | undefined{
    return this.wmHeight;
  }

  private offsetX?: number;

  public setOffsetX(offsetX:number):void {
    this.offsetX = offsetX;
  }

  getOffsetX(): number | undefined{
    return this.offsetX;
  }

  private offsetY?: number;

  public setOffsetY(offsetY:number):void {
    this.offsetY = offsetY;
  }

  getOffsetY(): number | undefined{
    return this.offsetY;
  }

  private wmColor?: number;

  public setWmColor(wmColor:number):void {
    this.wmColor = wmColor;
  }

  getWmColor(): number | undefined{
    return this.wmColor;
  }

  private fontSize?: number;

  public setFontSize(fontSize:number):void {
    this.fontSize = fontSize;
  }

  getFontSize(): number | undefined{
    return this.fontSize;
  }

  private fontColor?: number;

  public setFontColor(fontColor:number):void {
    this.fontColor = fontColor;
  }

  getFontColor(): number | undefined{
    return this.fontColor;
  }

  private fontNameOrPath?: string;

  public setFontNameOrPath(fontNameOrPath:string):void {
    this.fontNameOrPath = fontNameOrPath;
  }

  getFontNameOrPath(): string | undefined{
    return this.fontNameOrPath;
  }

  private content?: string;

  public setContent(content:string):void {
    this.content = content;
  }

  getContent(): string | undefined{
    return this.content;
  }

  constructor(wmAlpha?: number, wmWidth?: number, wmHeight?: number, offsetX?: number, offsetY?: number, wmColor?: number, fontSize?: number, fontColor?: number, fontNameOrPath?: string, content?: string) {
    this.wmAlpha = wmAlpha;
    this.wmWidth = wmWidth;
    this.wmHeight = wmHeight;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.wmColor = wmColor;
    this.fontSize = fontSize;
    this.fontColor = fontColor;
    this.fontNameOrPath = fontNameOrPath;
    this.content = content;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.wmAlpha !==undefined){
      arr.push(this.wmAlpha);
    }
    if(this.wmWidth !==undefined){
      arr.push(this.wmWidth);
    }
    if(this.wmHeight !==undefined){
      arr.push(this.wmHeight);
    }
    if(this.offsetX !==undefined){
      arr.push(this.offsetX);
    }
    if(this.offsetY !==undefined){
      arr.push(this.offsetY);
    }
    if(this.wmColor !==undefined){
      arr.push(this.wmColor);
    }
    if(this.fontSize !==undefined){
      arr.push(this.fontSize);
    }
    if(this.fontColor !==undefined){
      arr.push(this.fontColor);
    }
    if(this.fontNameOrPath !==undefined){
      arr.push(this.fontNameOrPath);
    }
    if(this.content !==undefined){
      arr.push(this.content);
    }
    return arr;
  }

  static fromList(arr: Object[]): VideoWatermarkTextConfig {
    let pigeonResult: VideoWatermarkTextConfig = new VideoWatermarkTextConfig();
    let wmAlpha: Object = arr[0];
    pigeonResult.setWmAlpha(wmAlpha as number);
    let wmWidth: Object = arr[1];
    pigeonResult.setWmWidth(wmWidth as number);
    let wmHeight: Object = arr[2];
    pigeonResult.setWmHeight(wmHeight as number);
    let offsetX: Object = arr[3];
    pigeonResult.setOffsetX(offsetX as number);
    let offsetY: Object = arr[4];
    pigeonResult.setOffsetY(offsetY as number);
    let wmColor: Object = arr[5];
    pigeonResult.setWmColor(wmColor as number);
    let fontSize: Object = arr[6];
    pigeonResult.setFontSize(fontSize as number);
    let fontColor: Object = arr[7];
    pigeonResult.setFontColor(fontColor as number);
    let fontNameOrPath: Object = arr[8];
    pigeonResult.setFontNameOrPath(fontNameOrPath as string);
    let content: Object = arr[9];
    pigeonResult.setContent(content as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class VideoWatermarkTimestampConfig {
  private wmAlpha?: number;

  public setWmAlpha(wmAlpha:number):void {
    this.wmAlpha = wmAlpha;
  }

  getWmAlpha(): number | undefined{
    return this.wmAlpha;
  }

  private wmWidth?: number;

  public setWmWidth(wmWidth:number):void {
    this.wmWidth = wmWidth;
  }

  getWmWidth(): number | undefined{
    return this.wmWidth;
  }

  private wmHeight?: number;

  public setWmHeight(wmHeight:number):void {
    this.wmHeight = wmHeight;
  }

  getWmHeight(): number | undefined{
    return this.wmHeight;
  }

  private offsetX?: number;

  public setOffsetX(offsetX:number):void {
    this.offsetX = offsetX;
  }

  getOffsetX(): number | undefined{
    return this.offsetX;
  }

  private offsetY?: number;

  public setOffsetY(offsetY:number):void {
    this.offsetY = offsetY;
  }

  getOffsetY(): number | undefined{
    return this.offsetY;
  }

  private wmColor?: number;

  public setWmColor(wmColor:number):void {
    this.wmColor = wmColor;
  }

  getWmColor(): number | undefined{
    return this.wmColor;
  }

  private fontSize?: number;

  public setFontSize(fontSize:number):void {
    this.fontSize = fontSize;
  }

  getFontSize(): number | undefined{
    return this.fontSize;
  }

  private fontColor?: number;

  public setFontColor(fontColor:number):void {
    this.fontColor = fontColor;
  }

  getFontColor(): number | undefined{
    return this.fontColor;
  }

  private fontNameOrPath?: string;

  public setFontNameOrPath(fontNameOrPath:string):void {
    this.fontNameOrPath = fontNameOrPath;
  }

  getFontNameOrPath(): string | undefined{
    return this.fontNameOrPath;
  }

  constructor(wmAlpha?: number, wmWidth?: number, wmHeight?: number, offsetX?: number, offsetY?: number, wmColor?: number, fontSize?: number, fontColor?: number, fontNameOrPath?: string) {
    this.wmAlpha = wmAlpha;
    this.wmWidth = wmWidth;
    this.wmHeight = wmHeight;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.wmColor = wmColor;
    this.fontSize = fontSize;
    this.fontColor = fontColor;
    this.fontNameOrPath = fontNameOrPath;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.wmAlpha !==undefined){
      arr.push(this.wmAlpha);
    }
    if(this.wmWidth !==undefined){
      arr.push(this.wmWidth);
    }
    if(this.wmHeight !==undefined){
      arr.push(this.wmHeight);
    }
    if(this.offsetX !==undefined){
      arr.push(this.offsetX);
    }
    if(this.offsetY !==undefined){
      arr.push(this.offsetY);
    }
    if(this.wmColor !==undefined){
      arr.push(this.wmColor);
    }
    if(this.fontSize !==undefined){
      arr.push(this.fontSize);
    }
    if(this.fontColor !==undefined){
      arr.push(this.fontColor);
    }
    if(this.fontNameOrPath !==undefined){
      arr.push(this.fontNameOrPath);
    }
    return arr;
  }

  static fromList(arr: Object[]): VideoWatermarkTimestampConfig {
    let pigeonResult: VideoWatermarkTimestampConfig = new VideoWatermarkTimestampConfig();
    let wmAlpha: Object = arr[0];
    pigeonResult.setWmAlpha(wmAlpha as number);
    let wmWidth: Object = arr[1];
    pigeonResult.setWmWidth(wmWidth as number);
    let wmHeight: Object = arr[2];
    pigeonResult.setWmHeight(wmHeight as number);
    let offsetX: Object = arr[3];
    pigeonResult.setOffsetX(offsetX as number);
    let offsetY: Object = arr[4];
    pigeonResult.setOffsetY(offsetY as number);
    let wmColor: Object = arr[5];
    pigeonResult.setWmColor(wmColor as number);
    let fontSize: Object = arr[6];
    pigeonResult.setFontSize(fontSize as number);
    let fontColor: Object = arr[7];
    pigeonResult.setFontColor(fontColor as number);
    let fontNameOrPath: Object = arr[8];
    pigeonResult.setFontNameOrPath(fontNameOrPath as string);
    return pigeonResult;
  }
}

/*
*  视频水印设置，目前支持三种类型的水印，但只能其中选择一种水印生效
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class VideoWatermarkConfig {
  private WatermarkType?: NERtcVideoWatermarkTypeEnum;

  public setWatermarkType(WatermarkType:NERtcVideoWatermarkTypeEnum):void {
    this.WatermarkType = WatermarkType;
  }

  getWatermarkType(): NERtcVideoWatermarkTypeEnum | undefined{
    return this.WatermarkType;
  }

  private imageWatermark?: VideoWatermarkImageConfig;

  public setImageWatermark(imageWatermark:VideoWatermarkImageConfig):void {
    this.imageWatermark = imageWatermark;
  }

  getImageWatermark(): VideoWatermarkImageConfig | undefined{
    return this.imageWatermark;
  }

  private textWatermark?: VideoWatermarkTextConfig;

  public setTextWatermark(textWatermark:VideoWatermarkTextConfig):void {
    this.textWatermark = textWatermark;
  }

  getTextWatermark(): VideoWatermarkTextConfig | undefined{
    return this.textWatermark;
  }

  private timestampWatermark?: VideoWatermarkTimestampConfig;

  public setTimestampWatermark(timestampWatermark:VideoWatermarkTimestampConfig):void {
    this.timestampWatermark = timestampWatermark;
  }

  getTimestampWatermark(): VideoWatermarkTimestampConfig | undefined{
    return this.timestampWatermark;
  }

  constructor(WatermarkType?: NERtcVideoWatermarkTypeEnum, imageWatermark?: VideoWatermarkImageConfig, textWatermark?: VideoWatermarkTextConfig, timestampWatermark?: VideoWatermarkTimestampConfig) {
    this.WatermarkType = WatermarkType;
    this.imageWatermark = imageWatermark;
    this.textWatermark = textWatermark;
    this.timestampWatermark = timestampWatermark;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.WatermarkType !==undefined){
      arr.push(Object.values(NERtcVideoWatermarkType).indexOf(this.WatermarkType.index! as NERtcVideoWatermarkType));
    }
    if(this.imageWatermark !==undefined){
      arr.push(this.imageWatermark);
    }
    if(this.textWatermark !==undefined){
      arr.push(this.textWatermark);
    }
    if(this.timestampWatermark !==undefined){
      arr.push(this.timestampWatermark);
    }
    return arr;
  }

  static fromList(arr: Object[]): VideoWatermarkConfig {
    let pigeonResult: VideoWatermarkConfig = new VideoWatermarkConfig();
    pigeonResult.setWatermarkType(new NERtcVideoWatermarkTypeEnum(arr[0]! as number));
    let imageWatermark: Object = arr[1];
    pigeonResult.setImageWatermark(imageWatermark as VideoWatermarkImageConfig);
    let textWatermark: Object = arr[2];
    pigeonResult.setTextWatermark(textWatermark as VideoWatermarkTextConfig);
    let timestampWatermark: Object = arr[3];
    pigeonResult.setTimestampWatermark(timestampWatermark as VideoWatermarkTimestampConfig);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetLocalVideoWatermarkConfigsRequest {
  private type?: number;

  public setType(type:number):void {
    this.type = type;
  }

  getType(): number | undefined{
    return this.type;
  }

  private config?: VideoWatermarkConfig;

  public setConfig(config:VideoWatermarkConfig):void {
    this.config = config;
  }

  getConfig(): VideoWatermarkConfig | undefined{
    return this.config;
  }

  constructor(type?: number, config?: VideoWatermarkConfig) {
    this.type = type;
    this.config = config;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.type !==undefined){
      arr.push(this.type);
    }
    if(this.config !==undefined){
      arr.push(this.config);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetLocalVideoWatermarkConfigsRequest {
    let pigeonResult: SetLocalVideoWatermarkConfigsRequest = new SetLocalVideoWatermarkConfigsRequest();
    let type: Object = arr[0];
    pigeonResult.setType(type as number);
    let config: Object = arr[1];
    pigeonResult.setConfig(config as VideoWatermarkConfig);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class PositionInfo {
  private mSpeakerPosition?: Array<number>;

  public setMSpeakerPosition(mSpeakerPosition:Array<number>):void {
    this.mSpeakerPosition = mSpeakerPosition;
  }

  getMSpeakerPosition(): Array<number> | undefined{
    return this.mSpeakerPosition;
  }

  private mSpeakerQuaternion?: Array<number>;

  public setMSpeakerQuaternion(mSpeakerQuaternion:Array<number>):void {
    this.mSpeakerQuaternion = mSpeakerQuaternion;
  }

  getMSpeakerQuaternion(): Array<number> | undefined{
    return this.mSpeakerQuaternion;
  }

  private mHeadPosition?: Array<number>;

  public setMHeadPosition(mHeadPosition:Array<number>):void {
    this.mHeadPosition = mHeadPosition;
  }

  getMHeadPosition(): Array<number> | undefined{
    return this.mHeadPosition;
  }

  private mHeadQuaternion?: Array<number>;

  public setMHeadQuaternion(mHeadQuaternion:Array<number>):void {
    this.mHeadQuaternion = mHeadQuaternion;
  }

  getMHeadQuaternion(): Array<number> | undefined{
    return this.mHeadQuaternion;
  }

  constructor(mSpeakerPosition?: Array<number>, mSpeakerQuaternion?: Array<number>, mHeadPosition?: Array<number>, mHeadQuaternion?: Array<number>) {
    this.mSpeakerPosition = mSpeakerPosition;
    this.mSpeakerQuaternion = mSpeakerQuaternion;
    this.mHeadPosition = mHeadPosition;
    this.mHeadQuaternion = mHeadQuaternion;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.mSpeakerPosition !==undefined){
      arr.push(this.mSpeakerPosition);
    }
    if(this.mSpeakerQuaternion !==undefined){
      arr.push(this.mSpeakerQuaternion);
    }
    if(this.mHeadPosition !==undefined){
      arr.push(this.mHeadPosition);
    }
    if(this.mHeadQuaternion !==undefined){
      arr.push(this.mHeadQuaternion);
    }
    return arr;
  }

  static fromList(arr: Object[]): PositionInfo {
    let pigeonResult: PositionInfo = new PositionInfo();
    let mSpeakerPosition: Object = arr[0];
    pigeonResult.setMSpeakerPosition(mSpeakerPosition as Array<number>);
    let mSpeakerQuaternion: Object = arr[1];
    pigeonResult.setMSpeakerQuaternion(mSpeakerQuaternion as Array<number>);
    let mHeadPosition: Object = arr[2];
    pigeonResult.setMHeadPosition(mHeadPosition as Array<number>);
    let mHeadQuaternion: Object = arr[3];
    pigeonResult.setMHeadQuaternion(mHeadQuaternion as Array<number>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SpatializerRoomProperty {
  private roomCapacity?: number;

  public setRoomCapacity(roomCapacity:number):void {
    this.roomCapacity = roomCapacity;
  }

  getRoomCapacity(): number | undefined{
    return this.roomCapacity;
  }

  private material?: number;

  public setMaterial(material:number):void {
    this.material = material;
  }

  getMaterial(): number | undefined{
    return this.material;
  }

  private reflectionScalar?: number;

  public setReflectionScalar(reflectionScalar:number):void {
    this.reflectionScalar = reflectionScalar;
  }

  getReflectionScalar(): number | undefined{
    return this.reflectionScalar;
  }

  private reverbGain?: number;

  public setReverbGain(reverbGain:number):void {
    this.reverbGain = reverbGain;
  }

  getReverbGain(): number | undefined{
    return this.reverbGain;
  }

  private reverbTime?: number;

  public setReverbTime(reverbTime:number):void {
    this.reverbTime = reverbTime;
  }

  getReverbTime(): number | undefined{
    return this.reverbTime;
  }

  private reverbBrightness?: number;

  public setReverbBrightness(reverbBrightness:number):void {
    this.reverbBrightness = reverbBrightness;
  }

  getReverbBrightness(): number | undefined{
    return this.reverbBrightness;
  }

  constructor(roomCapacity?: number, material?: number, reflectionScalar?: number, reverbGain?: number, reverbTime?: number, reverbBrightness?: number) {
    this.roomCapacity = roomCapacity;
    this.material = material;
    this.reflectionScalar = reflectionScalar;
    this.reverbGain = reverbGain;
    this.reverbTime = reverbTime;
    this.reverbBrightness = reverbBrightness;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.roomCapacity !==undefined){
      arr.push(this.roomCapacity);
    }
    if(this.material !==undefined){
      arr.push(this.material);
    }
    if(this.reflectionScalar !==undefined){
      arr.push(this.reflectionScalar);
    }
    if(this.reverbGain !==undefined){
      arr.push(this.reverbGain);
    }
    if(this.reverbTime !==undefined){
      arr.push(this.reverbTime);
    }
    if(this.reverbBrightness !==undefined){
      arr.push(this.reverbBrightness);
    }
    return arr;
  }

  static fromList(arr: Object[]): SpatializerRoomProperty {
    let pigeonResult: SpatializerRoomProperty = new SpatializerRoomProperty();
    let roomCapacity: Object = arr[0];
    pigeonResult.setRoomCapacity(roomCapacity as number);
    let material: Object = arr[1];
    pigeonResult.setMaterial(material as number);
    let reflectionScalar: Object = arr[2];
    pigeonResult.setReflectionScalar(reflectionScalar as number);
    let reverbGain: Object = arr[3];
    pigeonResult.setReverbGain(reverbGain as number);
    let reverbTime: Object = arr[4];
    pigeonResult.setReverbTime(reverbTime as number);
    let reverbBrightness: Object = arr[5];
    pigeonResult.setReverbBrightness(reverbBrightness as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class LocalRecordingConfig {
  private filePath?: string;

  public setFilePath(filePath:string):void {
    this.filePath = filePath;
  }

  getFilePath(): string | undefined{
    return this.filePath;
  }

  private fileName?: string;

  public setFileName(fileName:string):void {
    this.fileName = fileName;
  }

  getFileName(): string | undefined{
    return this.fileName;
  }

  private width?: number;

  public setWidth(width:number):void {
    this.width = width;
  }

  getWidth(): number | undefined{
    return this.width;
  }

  private height?: number;

  public setHeight(height:number):void {
    this.height = height;
  }

  getHeight(): number | undefined{
    return this.height;
  }

  private framerate?: number;

  public setFramerate(framerate:number):void {
    this.framerate = framerate;
  }

  getFramerate(): number | undefined{
    return this.framerate;
  }

  private recordFileType?: number;

  public setRecordFileType(recordFileType:number):void {
    this.recordFileType = recordFileType;
  }

  getRecordFileType(): number | undefined{
    return this.recordFileType;
  }

  private remuxToMp4?: boolean;

  public setRemuxToMp4(remuxToMp4:boolean):void {
    this.remuxToMp4 = remuxToMp4;
  }

  getRemuxToMp4(): boolean | undefined{
    return this.remuxToMp4;
  }

  private videoMerge?: boolean;

  public setVideoMerge(videoMerge:boolean):void {
    this.videoMerge = videoMerge;
  }

  getVideoMerge(): boolean | undefined{
    return this.videoMerge;
  }

  private recordAudio?: boolean;

  public setRecordAudio(recordAudio:boolean):void {
    this.recordAudio = recordAudio;
  }

  getRecordAudio(): boolean | undefined{
    return this.recordAudio;
  }

  private audioFormat?: number;

  public setAudioFormat(audioFormat:number):void {
    this.audioFormat = audioFormat;
  }

  getAudioFormat(): number | undefined{
    return this.audioFormat;
  }

  private recordVideo?: boolean;

  public setRecordVideo(recordVideo:boolean):void {
    this.recordVideo = recordVideo;
  }

  getRecordVideo(): boolean | undefined{
    return this.recordVideo;
  }

  private videoRecordMode?: number;

  public setVideoRecordMode(videoRecordMode:number):void {
    this.videoRecordMode = videoRecordMode;
  }

  getVideoRecordMode(): number | undefined{
    return this.videoRecordMode;
  }

  private watermarkList?: Array<VideoWatermarkConfig>;

  public setWatermarkList(watermarkList:Array<VideoWatermarkConfig>):void {
    this.watermarkList = watermarkList;
  }

  getWatermarkList(): Array<VideoWatermarkConfig> | undefined{
    return this.watermarkList;
  }

  private coverFilePath?: string;

  public setCoverFilePath(coverFilePath:string):void {
    this.coverFilePath = coverFilePath;
  }

  getCoverFilePath(): string | undefined{
    return this.coverFilePath;
  }

  private coverWatermarkList?: Array<VideoWatermarkConfig>;

  public setCoverWatermarkList(coverWatermarkList:Array<VideoWatermarkConfig>):void {
    this.coverWatermarkList = coverWatermarkList;
  }

  getCoverWatermarkList(): Array<VideoWatermarkConfig> | undefined{
    return this.coverWatermarkList;
  }

  private defaultCoverFilePath?: string;

  public setDefaultCoverFilePath(defaultCoverFilePath:string):void {
    this.defaultCoverFilePath = defaultCoverFilePath;
  }

  getDefaultCoverFilePath(): string | undefined{
    return this.defaultCoverFilePath;
  }

  constructor(filePath?: string, fileName?: string, width?: number, height?: number, framerate?: number, recordFileType?: number, remuxToMp4?: boolean, videoMerge?: boolean, recordAudio?: boolean, audioFormat?: number, recordVideo?: boolean, videoRecordMode?: number, watermarkList?: Array<VideoWatermarkConfig>, coverFilePath?: string, coverWatermarkList?: Array<VideoWatermarkConfig>, defaultCoverFilePath?: string) {
    this.filePath = filePath;
    this.fileName = fileName;
    this.width = width;
    this.height = height;
    this.framerate = framerate;
    this.recordFileType = recordFileType;
    this.remuxToMp4 = remuxToMp4;
    this.videoMerge = videoMerge;
    this.recordAudio = recordAudio;
    this.audioFormat = audioFormat;
    this.recordVideo = recordVideo;
    this.videoRecordMode = videoRecordMode;
    this.watermarkList = watermarkList;
    this.coverFilePath = coverFilePath;
    this.coverWatermarkList = coverWatermarkList;
    this.defaultCoverFilePath = defaultCoverFilePath;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.filePath !==undefined){
      arr.push(this.filePath);
    }
    if(this.fileName !==undefined){
      arr.push(this.fileName);
    }
    if(this.width !==undefined){
      arr.push(this.width);
    }
    if(this.height !==undefined){
      arr.push(this.height);
    }
    if(this.framerate !==undefined){
      arr.push(this.framerate);
    }
    if(this.recordFileType !==undefined){
      arr.push(this.recordFileType);
    }
    if(this.remuxToMp4 !==undefined){
      arr.push(this.remuxToMp4);
    }
    if(this.videoMerge !==undefined){
      arr.push(this.videoMerge);
    }
    if(this.recordAudio !==undefined){
      arr.push(this.recordAudio);
    }
    if(this.audioFormat !==undefined){
      arr.push(this.audioFormat);
    }
    if(this.recordVideo !==undefined){
      arr.push(this.recordVideo);
    }
    if(this.videoRecordMode !==undefined){
      arr.push(this.videoRecordMode);
    }
    if(this.watermarkList !==undefined){
      arr.push(this.watermarkList);
    }
    if(this.coverFilePath !==undefined){
      arr.push(this.coverFilePath);
    }
    if(this.coverWatermarkList !==undefined){
      arr.push(this.coverWatermarkList);
    }
    if(this.defaultCoverFilePath !==undefined){
      arr.push(this.defaultCoverFilePath);
    }
    return arr;
  }

  static fromList(arr: Object[]): LocalRecordingConfig {
    let pigeonResult: LocalRecordingConfig = new LocalRecordingConfig();
    let filePath: Object = arr[0];
    pigeonResult.setFilePath(filePath as string);
    let fileName: Object = arr[1];
    pigeonResult.setFileName(fileName as string);
    let width: Object = arr[2];
    pigeonResult.setWidth(width as number);
    let height: Object = arr[3];
    pigeonResult.setHeight(height as number);
    let framerate: Object = arr[4];
    pigeonResult.setFramerate(framerate as number);
    let recordFileType: Object = arr[5];
    pigeonResult.setRecordFileType(recordFileType as number);
    let remuxToMp4: Object = arr[6];
    pigeonResult.setRemuxToMp4(remuxToMp4 as boolean);
    let videoMerge: Object = arr[7];
    pigeonResult.setVideoMerge(videoMerge as boolean);
    let recordAudio: Object = arr[8];
    pigeonResult.setRecordAudio(recordAudio as boolean);
    let audioFormat: Object = arr[9];
    pigeonResult.setAudioFormat(audioFormat as number);
    let recordVideo: Object = arr[10];
    pigeonResult.setRecordVideo(recordVideo as boolean);
    let videoRecordMode: Object = arr[11];
    pigeonResult.setVideoRecordMode(videoRecordMode as number);
    let watermarkList: Object = arr[12];
    pigeonResult.setWatermarkList(watermarkList as Array<VideoWatermarkConfig>);
    let coverFilePath: Object = arr[13];
    pigeonResult.setCoverFilePath(coverFilePath as string);
    let coverWatermarkList: Object = arr[14];
    pigeonResult.setCoverWatermarkList(coverWatermarkList as Array<VideoWatermarkConfig>);
    let defaultCoverFilePath: Object = arr[15];
    pigeonResult.setDefaultCoverFilePath(defaultCoverFilePath as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class LocalRecordingLayoutConfig {
  private offsetX?: number;

  public setOffsetX(offsetX:number):void {
    this.offsetX = offsetX;
  }

  getOffsetX(): number | undefined{
    return this.offsetX;
  }

  private offsetY?: number;

  public setOffsetY(offsetY:number):void {
    this.offsetY = offsetY;
  }

  getOffsetY(): number | undefined{
    return this.offsetY;
  }

  private width?: number;

  public setWidth(width:number):void {
    this.width = width;
  }

  getWidth(): number | undefined{
    return this.width;
  }

  private height?: number;

  public setHeight(height:number):void {
    this.height = height;
  }

  getHeight(): number | undefined{
    return this.height;
  }

  private scalingMode?: number;

  public setScalingMode(scalingMode:number):void {
    this.scalingMode = scalingMode;
  }

  getScalingMode(): number | undefined{
    return this.scalingMode;
  }

  private watermarkList?: Array<VideoWatermarkConfig>;

  public setWatermarkList(watermarkList:Array<VideoWatermarkConfig>):void {
    this.watermarkList = watermarkList;
  }

  getWatermarkList(): Array<VideoWatermarkConfig> | undefined{
    return this.watermarkList;
  }

  private isScreenShare?: boolean;

  public setIsScreenShare(isScreenShare:boolean):void {
    this.isScreenShare = isScreenShare;
  }

  getIsScreenShare(): boolean | undefined{
    return this.isScreenShare;
  }

  private bgColor?: number;

  public setBgColor(bgColor:number):void {
    this.bgColor = bgColor;
  }

  getBgColor(): number | undefined{
    return this.bgColor;
  }

  constructor(offsetX?: number, offsetY?: number, width?: number, height?: number, scalingMode?: number, watermarkList?: Array<VideoWatermarkConfig>, isScreenShare?: boolean, bgColor?: number) {
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.width = width;
    this.height = height;
    this.scalingMode = scalingMode;
    this.watermarkList = watermarkList;
    this.isScreenShare = isScreenShare;
    this.bgColor = bgColor;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.offsetX !==undefined){
      arr.push(this.offsetX);
    }
    if(this.offsetY !==undefined){
      arr.push(this.offsetY);
    }
    if(this.width !==undefined){
      arr.push(this.width);
    }
    if(this.height !==undefined){
      arr.push(this.height);
    }
    if(this.scalingMode !==undefined){
      arr.push(this.scalingMode);
    }
    if(this.watermarkList !==undefined){
      arr.push(this.watermarkList);
    }
    if(this.isScreenShare !==undefined){
      arr.push(this.isScreenShare);
    }
    if(this.bgColor !==undefined){
      arr.push(this.bgColor);
    }
    return arr;
  }

  static fromList(arr: Object[]): LocalRecordingLayoutConfig {
    let pigeonResult: LocalRecordingLayoutConfig = new LocalRecordingLayoutConfig();
    let offsetX: Object = arr[0];
    pigeonResult.setOffsetX(offsetX as number);
    let offsetY: Object = arr[1];
    pigeonResult.setOffsetY(offsetY as number);
    let width: Object = arr[2];
    pigeonResult.setWidth(width as number);
    let height: Object = arr[3];
    pigeonResult.setHeight(height as number);
    let scalingMode: Object = arr[4];
    pigeonResult.setScalingMode(scalingMode as number);
    let watermarkList: Object = arr[5];
    pigeonResult.setWatermarkList(watermarkList as Array<VideoWatermarkConfig>);
    let isScreenShare: Object = arr[6];
    pigeonResult.setIsScreenShare(isScreenShare as boolean);
    let bgColor: Object = arr[7];
    pigeonResult.setBgColor(bgColor as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class LocalRecordingStreamInfo {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private streamType?: number;

  public setStreamType(streamType:number):void {
    this.streamType = streamType;
  }

  getStreamType(): number | undefined{
    return this.streamType;
  }

  private streamLayer?: number;

  public setStreamLayer(streamLayer:number):void {
    this.streamLayer = streamLayer;
  }

  getStreamLayer(): number | undefined{
    return this.streamLayer;
  }

  private layoutConfig?: LocalRecordingLayoutConfig;

  public setLayoutConfig(layoutConfig:LocalRecordingLayoutConfig):void {
    this.layoutConfig = layoutConfig;
  }

  getLayoutConfig(): LocalRecordingLayoutConfig | undefined{
    return this.layoutConfig;
  }

  constructor(uid?: number, streamType?: number, streamLayer?: number, layoutConfig?: LocalRecordingLayoutConfig) {
    this.uid = uid;
    this.streamType = streamType;
    this.streamLayer = streamLayer;
    this.layoutConfig = layoutConfig;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.streamType !==undefined){
      arr.push(this.streamType);
    }
    if(this.streamLayer !==undefined){
      arr.push(this.streamLayer);
    }
    if(this.layoutConfig !==undefined){
      arr.push(this.layoutConfig);
    }
    return arr;
  }

  static fromList(arr: Object[]): LocalRecordingStreamInfo {
    let pigeonResult: LocalRecordingStreamInfo = new LocalRecordingStreamInfo();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let streamType: Object = arr[1];
    pigeonResult.setStreamType(streamType as number);
    let streamLayer: Object = arr[2];
    pigeonResult.setStreamLayer(streamLayer as number);
    let layoutConfig: Object = arr[3];
    pigeonResult.setLayoutConfig(layoutConfig as LocalRecordingLayoutConfig);
    return pigeonResult;
  }
}

/*
*  NERtc 版本信息
*
*  Generated class from Pigeon that represents data sent in messages.
*/
export class NERtcVersion {
  private versionName?: string;

  public setVersionName(versionName:string):void {
    this.versionName = versionName;
  }

  getVersionName(): string | undefined{
    return this.versionName;
  }

  private versionCode?: number;

  public setVersionCode(versionCode:number):void {
    this.versionCode = versionCode;
  }

  getVersionCode(): number | undefined{
    return this.versionCode;
  }

  private buildType?: string;

  public setBuildType(buildType:string):void {
    this.buildType = buildType;
  }

  getBuildType(): string | undefined{
    return this.buildType;
  }

  private buildDate?: string;

  public setBuildDate(buildDate:string):void {
    this.buildDate = buildDate;
  }

  getBuildDate(): string | undefined{
    return this.buildDate;
  }

  private buildRevision?: string;

  public setBuildRevision(buildRevision:string):void {
    this.buildRevision = buildRevision;
  }

  getBuildRevision(): string | undefined{
    return this.buildRevision;
  }

  private buildHost?: string;

  public setBuildHost(buildHost:string):void {
    this.buildHost = buildHost;
  }

  getBuildHost(): string | undefined{
    return this.buildHost;
  }

  private serverEnv?: string;

  public setServerEnv(serverEnv:string):void {
    this.serverEnv = serverEnv;
  }

  getServerEnv(): string | undefined{
    return this.serverEnv;
  }

  private buildBranch?: string;

  public setBuildBranch(buildBranch:string):void {
    this.buildBranch = buildBranch;
  }

  getBuildBranch(): string | undefined{
    return this.buildBranch;
  }

  private engineRevision?: string;

  public setEngineRevision(engineRevision:string):void {
    this.engineRevision = engineRevision;
  }

  getEngineRevision(): string | undefined{
    return this.engineRevision;
  }

  constructor(versionName?: string, versionCode?: number, buildType?: string, buildDate?: string, buildRevision?: string, buildHost?: string, serverEnv?: string, buildBranch?: string, engineRevision?: string) {
    this.versionName = versionName;
    this.versionCode = versionCode;
    this.buildType = buildType;
    this.buildDate = buildDate;
    this.buildRevision = buildRevision;
    this.buildHost = buildHost;
    this.serverEnv = serverEnv;
    this.buildBranch = buildBranch;
    this.engineRevision = engineRevision;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.versionName !==undefined){
      arr.push(this.versionName);
    }
    if(this.versionCode !==undefined){
      arr.push(this.versionCode);
    }
    if(this.buildType !==undefined){
      arr.push(this.buildType);
    }
    if(this.buildDate !==undefined){
      arr.push(this.buildDate);
    }
    if(this.buildRevision !==undefined){
      arr.push(this.buildRevision);
    }
    if(this.buildHost !==undefined){
      arr.push(this.buildHost);
    }
    if(this.serverEnv !==undefined){
      arr.push(this.serverEnv);
    }
    if(this.buildBranch !==undefined){
      arr.push(this.buildBranch);
    }
    if(this.engineRevision !==undefined){
      arr.push(this.engineRevision);
    }
    return arr;
  }

  static fromList(arr: Object[]): NERtcVersion {
    let pigeonResult: NERtcVersion = new NERtcVersion();
    let versionName: Object = arr[0];
    pigeonResult.setVersionName(versionName as string);
    let versionCode: Object = arr[1];
    pigeonResult.setVersionCode(versionCode as number);
    let buildType: Object = arr[2];
    pigeonResult.setBuildType(buildType as string);
    let buildDate: Object = arr[3];
    pigeonResult.setBuildDate(buildDate as string);
    let buildRevision: Object = arr[4];
    pigeonResult.setBuildRevision(buildRevision as string);
    let buildHost: Object = arr[5];
    pigeonResult.setBuildHost(buildHost as string);
    let serverEnv: Object = arr[6];
    pigeonResult.setServerEnv(serverEnv as string);
    let buildBranch: Object = arr[7];
    pigeonResult.setBuildBranch(buildBranch as string);
    let engineRevision: Object = arr[8];
    pigeonResult.setEngineRevision(engineRevision as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class VideoFrame {
  private width?: number;

  public setWidth(width:number):void {
    this.width = width;
  }

  getWidth(): number | undefined{
    return this.width;
  }

  private height?: number;

  public setHeight(height:number):void {
    this.height = height;
  }

  getHeight(): number | undefined{
    return this.height;
  }

  private rotation?: number;

  public setRotation(rotation:number):void {
    this.rotation = rotation;
  }

  getRotation(): number | undefined{
    return this.rotation;
  }

  private format?: number;

  public setFormat(format:number):void {
    this.format = format;
  }

  getFormat(): number | undefined{
    return this.format;
  }

  private timeStamp?: number;

  public setTimeStamp(timeStamp:number):void {
    this.timeStamp = timeStamp;
  }

  getTimeStamp(): number | undefined{
    return this.timeStamp;
  }

  private data?: number[];

  public setData(data:number[]):void {
    this.data = data;
  }

  getData(): number[] | undefined{
    return this.data;
  }

  private strideY?: number;

  public setStrideY(strideY:number):void {
    this.strideY = strideY;
  }

  getStrideY(): number | undefined{
    return this.strideY;
  }

  private strideU?: number;

  public setStrideU(strideU:number):void {
    this.strideU = strideU;
  }

  getStrideU(): number | undefined{
    return this.strideU;
  }

  private strideV?: number;

  public setStrideV(strideV:number):void {
    this.strideV = strideV;
  }

  getStrideV(): number | undefined{
    return this.strideV;
  }

  private textureId?: number;

  public setTextureId(textureId:number):void {
    this.textureId = textureId;
  }

  getTextureId(): number | undefined{
    return this.textureId;
  }

  private transformMatrix?: Array<number>;

  public setTransformMatrix(transformMatrix:Array<number>):void {
    this.transformMatrix = transformMatrix;
  }

  getTransformMatrix(): Array<number> | undefined{
    return this.transformMatrix;
  }

  constructor(width?: number, height?: number, rotation?: number, format?: number, timeStamp?: number, data?: number[], strideY?: number, strideU?: number, strideV?: number, textureId?: number, transformMatrix?: Array<number>) {
    this.width = width;
    this.height = height;
    this.rotation = rotation;
    this.format = format;
    this.timeStamp = timeStamp;
    this.data = data;
    this.strideY = strideY;
    this.strideU = strideU;
    this.strideV = strideV;
    this.textureId = textureId;
    this.transformMatrix = transformMatrix;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.width !==undefined){
      arr.push(this.width);
    }
    if(this.height !==undefined){
      arr.push(this.height);
    }
    if(this.rotation !==undefined){
      arr.push(this.rotation);
    }
    if(this.format !==undefined){
      arr.push(this.format);
    }
    if(this.timeStamp !==undefined){
      arr.push(this.timeStamp);
    }
    if(this.data !==undefined){
      arr.push(this.data);
    }
    if(this.strideY !==undefined){
      arr.push(this.strideY);
    }
    if(this.strideU !==undefined){
      arr.push(this.strideU);
    }
    if(this.strideV !==undefined){
      arr.push(this.strideV);
    }
    if(this.textureId !==undefined){
      arr.push(this.textureId);
    }
    if(this.transformMatrix !==undefined){
      arr.push(this.transformMatrix);
    }
    return arr;
  }

  static fromList(arr: Object[]): VideoFrame {
    let pigeonResult: VideoFrame = new VideoFrame();
    let width: Object = arr[0];
    pigeonResult.setWidth(width as number);
    let height: Object = arr[1];
    pigeonResult.setHeight(height as number);
    let rotation: Object = arr[2];
    pigeonResult.setRotation(rotation as number);
    let format: Object = arr[3];
    pigeonResult.setFormat(format as number);
    let timeStamp: Object = arr[4];
    pigeonResult.setTimeStamp(timeStamp as number);
    let data: Object = arr[5];
    pigeonResult.setData(data as number[]);
    let strideY: Object = arr[6];
    pigeonResult.setStrideY(strideY as number);
    let strideU: Object = arr[7];
    pigeonResult.setStrideU(strideU as number);
    let strideV: Object = arr[8];
    pigeonResult.setStrideV(strideV as number);
    let textureId: Object = arr[9];
    pigeonResult.setTextureId(textureId as number);
    let transformMatrix: Object = arr[10];
    pigeonResult.setTransformMatrix(transformMatrix as Array<number>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class DataExternalFrame {
  private data?: number[];

  public setData(data:number[]):void {
    this.data = data;
  }

  getData(): number[] | undefined{
    return this.data;
  }

  private dataSize?: number;

  public setDataSize(dataSize:number):void {
    this.dataSize = dataSize;
  }

  getDataSize(): number | undefined{
    return this.dataSize;
  }

  constructor(data?: number[], dataSize?: number) {
    this.data = data;
    this.dataSize = dataSize;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.data !==undefined){
      arr.push(this.data);
    }
    if(this.dataSize !==undefined){
      arr.push(this.dataSize);
    }
    return arr;
  }

  static fromList(arr: Object[]): DataExternalFrame {
    let pigeonResult: DataExternalFrame = new DataExternalFrame();
    let data: Object = arr[0];
    pigeonResult.setData(data as number[]);
    let dataSize: Object = arr[1];
    pigeonResult.setDataSize(dataSize as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AudioExternalFrame {
  private data?: number[];

  public setData(data:number[]):void {
    this.data = data;
  }

  getData(): number[] | undefined{
    return this.data;
  }

  private sampleRate?: number;

  public setSampleRate(sampleRate:number):void {
    this.sampleRate = sampleRate;
  }

  getSampleRate(): number | undefined{
    return this.sampleRate;
  }

  private numberOfChannels?: number;

  public setNumberOfChannels(numberOfChannels:number):void {
    this.numberOfChannels = numberOfChannels;
  }

  getNumberOfChannels(): number | undefined{
    return this.numberOfChannels;
  }

  private samplesPerChannel?: number;

  public setSamplesPerChannel(samplesPerChannel:number):void {
    this.samplesPerChannel = samplesPerChannel;
  }

  getSamplesPerChannel(): number | undefined{
    return this.samplesPerChannel;
  }

  private syncTimestamp?: number;

  public setSyncTimestamp(syncTimestamp:number):void {
    this.syncTimestamp = syncTimestamp;
  }

  getSyncTimestamp(): number | undefined{
    return this.syncTimestamp;
  }

  constructor(data?: number[], sampleRate?: number, numberOfChannels?: number, samplesPerChannel?: number, syncTimestamp?: number) {
    this.data = data;
    this.sampleRate = sampleRate;
    this.numberOfChannels = numberOfChannels;
    this.samplesPerChannel = samplesPerChannel;
    this.syncTimestamp = syncTimestamp;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.data !==undefined){
      arr.push(this.data);
    }
    if(this.sampleRate !==undefined){
      arr.push(this.sampleRate);
    }
    if(this.numberOfChannels !==undefined){
      arr.push(this.numberOfChannels);
    }
    if(this.samplesPerChannel !==undefined){
      arr.push(this.samplesPerChannel);
    }
    if(this.syncTimestamp !==undefined){
      arr.push(this.syncTimestamp);
    }
    return arr;
  }

  static fromList(arr: Object[]): AudioExternalFrame {
    let pigeonResult: AudioExternalFrame = new AudioExternalFrame();
    let data: Object = arr[0];
    pigeonResult.setData(data as number[]);
    let sampleRate: Object = arr[1];
    pigeonResult.setSampleRate(sampleRate as number);
    let numberOfChannels: Object = arr[2];
    pigeonResult.setNumberOfChannels(numberOfChannels as number);
    let samplesPerChannel: Object = arr[3];
    pigeonResult.setSamplesPerChannel(samplesPerChannel as number);
    let syncTimestamp: Object = arr[4];
    pigeonResult.setSyncTimestamp(syncTimestamp as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StreamingRoomInfo {
  private uid?: number;

  public setUid(uid:number):void {
    this.uid = uid;
  }

  getUid(): number | undefined{
    return this.uid;
  }

  private channelName?: string;

  public setChannelName(channelName:string):void {
    this.channelName = channelName;
  }

  getChannelName(): string | undefined{
    return this.channelName;
  }

  private token?: string;

  public setToken(token:string):void {
    this.token = token;
  }

  getToken(): string | undefined{
    return this.token;
  }

  constructor(uid?: number, channelName?: string, token?: string) {
    this.uid = uid;
    this.channelName = channelName;
    this.token = token;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.uid !==undefined){
      arr.push(this.uid);
    }
    if(this.channelName !==undefined){
      arr.push(this.channelName);
    }
    if(this.token !==undefined){
      arr.push(this.token);
    }
    return arr;
  }

  static fromList(arr: Object[]): StreamingRoomInfo {
    let pigeonResult: StreamingRoomInfo = new StreamingRoomInfo();
    let uid: Object = arr[0];
    pigeonResult.setUid(uid as number);
    let channelName: Object = arr[1];
    pigeonResult.setChannelName(channelName as string);
    let token: Object = arr[2];
    pigeonResult.setToken(token as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartPushStreamingRequest {
  private streamingUrl?: string;

  public setStreamingUrl(streamingUrl:string):void {
    this.streamingUrl = streamingUrl;
  }

  getStreamingUrl(): string | undefined{
    return this.streamingUrl;
  }

  private streamingRoomInfo?: StreamingRoomInfo;

  public setStreamingRoomInfo(streamingRoomInfo:StreamingRoomInfo):void {
    this.streamingRoomInfo = streamingRoomInfo;
  }

  getStreamingRoomInfo(): StreamingRoomInfo | undefined{
    return this.streamingRoomInfo;
  }

  constructor(streamingUrl?: string, streamingRoomInfo?: StreamingRoomInfo) {
    this.streamingUrl = streamingUrl;
    this.streamingRoomInfo = streamingRoomInfo;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.streamingUrl !==undefined){
      arr.push(this.streamingUrl);
    }
    if(this.streamingRoomInfo !==undefined){
      arr.push(this.streamingRoomInfo);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartPushStreamingRequest {
    let pigeonResult: StartPushStreamingRequest = new StartPushStreamingRequest();
    let streamingUrl: Object = arr[0];
    pigeonResult.setStreamingUrl(streamingUrl as string);
    let streamingRoomInfo: Object = arr[1];
    pigeonResult.setStreamingRoomInfo(streamingRoomInfo as StreamingRoomInfo);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartPlayStreamingRequest {
  private streamId?: string;

  public setStreamId(streamId:string):void {
    this.streamId = streamId;
  }

  getStreamId(): string | undefined{
    return this.streamId;
  }

  private streamingUrl?: string;

  public setStreamingUrl(streamingUrl:string):void {
    this.streamingUrl = streamingUrl;
  }

  getStreamingUrl(): string | undefined{
    return this.streamingUrl;
  }

  private playOutDelay?: number;

  public setPlayOutDelay(playOutDelay:number):void {
    this.playOutDelay = playOutDelay;
  }

  getPlayOutDelay(): number | undefined{
    return this.playOutDelay;
  }

  private reconnectTimeout?: number;

  public setReconnectTimeout(reconnectTimeout:number):void {
    this.reconnectTimeout = reconnectTimeout;
  }

  getReconnectTimeout(): number | undefined{
    return this.reconnectTimeout;
  }

  private muteAudio?: boolean;

  public setMuteAudio(muteAudio:boolean):void {
    this.muteAudio = muteAudio;
  }

  getMuteAudio(): boolean | undefined{
    return this.muteAudio;
  }

  private muteVideo?: boolean;

  public setMuteVideo(muteVideo:boolean):void {
    this.muteVideo = muteVideo;
  }

  getMuteVideo(): boolean | undefined{
    return this.muteVideo;
  }

  private pausePullStream?: boolean;

  public setPausePullStream(pausePullStream:boolean):void {
    this.pausePullStream = pausePullStream;
  }

  getPausePullStream(): boolean | undefined{
    return this.pausePullStream;
  }

  constructor(streamId?: string, streamingUrl?: string, playOutDelay?: number, reconnectTimeout?: number, muteAudio?: boolean, muteVideo?: boolean, pausePullStream?: boolean) {
    this.streamId = streamId;
    this.streamingUrl = streamingUrl;
    this.playOutDelay = playOutDelay;
    this.reconnectTimeout = reconnectTimeout;
    this.muteAudio = muteAudio;
    this.muteVideo = muteVideo;
    this.pausePullStream = pausePullStream;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.streamId !==undefined){
      arr.push(this.streamId);
    }
    if(this.streamingUrl !==undefined){
      arr.push(this.streamingUrl);
    }
    if(this.playOutDelay !==undefined){
      arr.push(this.playOutDelay);
    }
    if(this.reconnectTimeout !==undefined){
      arr.push(this.reconnectTimeout);
    }
    if(this.muteAudio !==undefined){
      arr.push(this.muteAudio);
    }
    if(this.muteVideo !==undefined){
      arr.push(this.muteVideo);
    }
    if(this.pausePullStream !==undefined){
      arr.push(this.pausePullStream);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartPlayStreamingRequest {
    let pigeonResult: StartPlayStreamingRequest = new StartPlayStreamingRequest();
    let streamId: Object = arr[0];
    pigeonResult.setStreamId(streamId as string);
    let streamingUrl: Object = arr[1];
    pigeonResult.setStreamingUrl(streamingUrl as string);
    let playOutDelay: Object = arr[2];
    pigeonResult.setPlayOutDelay(playOutDelay as number);
    let reconnectTimeout: Object = arr[3];
    pigeonResult.setReconnectTimeout(reconnectTimeout as number);
    let muteAudio: Object = arr[4];
    pigeonResult.setMuteAudio(muteAudio as boolean);
    let muteVideo: Object = arr[5];
    pigeonResult.setMuteVideo(muteVideo as boolean);
    let pausePullStream: Object = arr[6];
    pigeonResult.setPausePullStream(pausePullStream as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class StartASRCaptionRequest {
  private srcLanguage?: string;

  public setSrcLanguage(srcLanguage:string):void {
    this.srcLanguage = srcLanguage;
  }

  getSrcLanguage(): string | undefined{
    return this.srcLanguage;
  }

  private srcLanguageArr?: Array<string>;

  public setSrcLanguageArr(srcLanguageArr:Array<string>):void {
    this.srcLanguageArr = srcLanguageArr;
  }

  getSrcLanguageArr(): Array<string> | undefined{
    return this.srcLanguageArr;
  }

  private dstLanguageArr?: Array<string>;

  public setDstLanguageArr(dstLanguageArr:Array<string>):void {
    this.dstLanguageArr = dstLanguageArr;
  }

  getDstLanguageArr(): Array<string> | undefined{
    return this.dstLanguageArr;
  }

  private needTranslateSameLanguage?: boolean;

  public setNeedTranslateSameLanguage(needTranslateSameLanguage:boolean):void {
    this.needTranslateSameLanguage = needTranslateSameLanguage;
  }

  getNeedTranslateSameLanguage(): boolean | undefined{
    return this.needTranslateSameLanguage;
  }

  constructor(srcLanguage?: string, srcLanguageArr?: Array<string>, dstLanguageArr?: Array<string>, needTranslateSameLanguage?: boolean) {
    this.srcLanguage = srcLanguage;
    this.srcLanguageArr = srcLanguageArr;
    this.dstLanguageArr = dstLanguageArr;
    this.needTranslateSameLanguage = needTranslateSameLanguage;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.srcLanguage !==undefined){
      arr.push(this.srcLanguage);
    }
    if(this.srcLanguageArr !==undefined){
      arr.push(this.srcLanguageArr);
    }
    if(this.dstLanguageArr !==undefined){
      arr.push(this.dstLanguageArr);
    }
    if(this.needTranslateSameLanguage !==undefined){
      arr.push(this.needTranslateSameLanguage);
    }
    return arr;
  }

  static fromList(arr: Object[]): StartASRCaptionRequest {
    let pigeonResult: StartASRCaptionRequest = new StartASRCaptionRequest();
    let srcLanguage: Object = arr[0];
    pigeonResult.setSrcLanguage(srcLanguage as string);
    let srcLanguageArr: Object = arr[1];
    pigeonResult.setSrcLanguageArr(srcLanguageArr as Array<string>);
    let dstLanguageArr: Object = arr[2];
    pigeonResult.setDstLanguageArr(dstLanguageArr as Array<string>);
    let needTranslateSameLanguage: Object = arr[3];
    pigeonResult.setNeedTranslateSameLanguage(needTranslateSameLanguage as boolean);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class SetMultiPathOptionRequest {
  private enableMediaMultiPath?: boolean;

  public setEnableMediaMultiPath(enableMediaMultiPath:boolean):void {
    this.enableMediaMultiPath = enableMediaMultiPath;
  }

  getEnableMediaMultiPath(): boolean | undefined{
    return this.enableMediaMultiPath;
  }

  private mediaMode?: number;

  public setMediaMode(mediaMode:number):void {
    this.mediaMode = mediaMode;
  }

  getMediaMode(): number | undefined{
    return this.mediaMode;
  }

  private badRttThreshold?: number;

  public setBadRttThreshold(badRttThreshold:number):void {
    this.badRttThreshold = badRttThreshold;
  }

  getBadRttThreshold(): number | undefined{
    return this.badRttThreshold;
  }

  private redAudioPacket?: boolean;

  public setRedAudioPacket(redAudioPacket:boolean):void {
    this.redAudioPacket = redAudioPacket;
  }

  getRedAudioPacket(): boolean | undefined{
    return this.redAudioPacket;
  }

  private redAudioRtxPacket?: boolean;

  public setRedAudioRtxPacket(redAudioRtxPacket:boolean):void {
    this.redAudioRtxPacket = redAudioRtxPacket;
  }

  getRedAudioRtxPacket(): boolean | undefined{
    return this.redAudioRtxPacket;
  }

  private redVideoPacket?: boolean;

  public setRedVideoPacket(redVideoPacket:boolean):void {
    this.redVideoPacket = redVideoPacket;
  }

  getRedVideoPacket(): boolean | undefined{
    return this.redVideoPacket;
  }

  private redVideoRtxPacket?: boolean;

  public setRedVideoRtxPacket(redVideoRtxPacket:boolean):void {
    this.redVideoRtxPacket = redVideoRtxPacket;
  }

  getRedVideoRtxPacket(): boolean | undefined{
    return this.redVideoRtxPacket;
  }

  constructor(enableMediaMultiPath?: boolean, mediaMode?: number, badRttThreshold?: number, redAudioPacket?: boolean, redAudioRtxPacket?: boolean, redVideoPacket?: boolean, redVideoRtxPacket?: boolean) {
    this.enableMediaMultiPath = enableMediaMultiPath;
    this.mediaMode = mediaMode;
    this.badRttThreshold = badRttThreshold;
    this.redAudioPacket = redAudioPacket;
    this.redAudioRtxPacket = redAudioRtxPacket;
    this.redVideoPacket = redVideoPacket;
    this.redVideoRtxPacket = redVideoRtxPacket;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.enableMediaMultiPath !==undefined){
      arr.push(this.enableMediaMultiPath);
    }
    if(this.mediaMode !==undefined){
      arr.push(this.mediaMode);
    }
    if(this.badRttThreshold !==undefined){
      arr.push(this.badRttThreshold);
    }
    if(this.redAudioPacket !==undefined){
      arr.push(this.redAudioPacket);
    }
    if(this.redAudioRtxPacket !==undefined){
      arr.push(this.redAudioRtxPacket);
    }
    if(this.redVideoPacket !==undefined){
      arr.push(this.redVideoPacket);
    }
    if(this.redVideoRtxPacket !==undefined){
      arr.push(this.redVideoRtxPacket);
    }
    return arr;
  }

  static fromList(arr: Object[]): SetMultiPathOptionRequest {
    let pigeonResult: SetMultiPathOptionRequest = new SetMultiPathOptionRequest();
    let enableMediaMultiPath: Object = arr[0];
    pigeonResult.setEnableMediaMultiPath(enableMediaMultiPath as boolean);
    let mediaMode: Object = arr[1];
    pigeonResult.setMediaMode(mediaMode as number);
    let badRttThreshold: Object = arr[2];
    pigeonResult.setBadRttThreshold(badRttThreshold as number);
    let redAudioPacket: Object = arr[3];
    pigeonResult.setRedAudioPacket(redAudioPacket as boolean);
    let redAudioRtxPacket: Object = arr[4];
    pigeonResult.setRedAudioRtxPacket(redAudioRtxPacket as boolean);
    let redVideoPacket: Object = arr[5];
    pigeonResult.setRedVideoPacket(redVideoPacket as boolean);
    let redVideoRtxPacket: Object = arr[6];
    pigeonResult.setRedVideoRtxPacket(redVideoRtxPacket as boolean);
    return pigeonResult;
  }
}

class PigeonCodec extends StandardMessageCodec {
  static readonly INSTANCE: PigeonCodec  = new PigeonCodec();

  getByte(n: number): number {
    let byteArray = new Uint8Array(1);
    byteArray[0] = n;
    return byteArray[0] as number;
  }
  private constructor() {
    super();
  }

  readValueOfType(type: number,  buffer: ByteBuffer): ESObject {
    switch (type) {
      case this.getByte(129): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : NERtcVideoWatermarkType[value as number];
      }
      case this.getByte(130): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : NERtcCaptureExtraRotation[value as number];
      }
      case this.getByte(131):
        return NERtcUserJoinExtraInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(132):
        return NERtcUserLeaveExtraInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(133):
        return UserJoinedEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(134):
        return UserLeaveEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(135):
        return UserVideoMuteEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(136):
        return FirstVideoDataReceivedEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(137):
        return FirstVideoFrameDecodedEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(138):
        return VirtualBackgroundSourceEnabledEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(139):
        return AudioVolumeInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(140):
        return RemoteAudioVolumeIndicationEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(141):
        return Rectangle.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(142):
        return ScreenCaptureSourceData.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(143):
        return NERtcLastmileProbeResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(144):
        return NERtcLastmileProbeOneWayResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(145):
        return RtcServerAddresses.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(146):
        return CreateEngineRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(147):
        return JoinChannelOptions.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(148):
        return JoinChannelRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(149):
        return NERtcLLMRequestParams.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(150):
        return NERtcLLMRequestResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(151):
        return RequestLLMRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(152):
        return SubscribeRemoteAudioRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(153):
        return EnableLocalVideoRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(154):
        return SetAudioProfileRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(155):
        return SetLocalVideoConfigRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(156):
        return SetCameraCaptureConfigRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(157):
        return StartorStopVideoPreviewRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(158):
        return StartScreenCaptureRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(159):
        return SubscribeRemoteVideoStreamRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(160):
        return SubscribeRemoteSubStreamVideoRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(161):
        return EnableAudioVolumeIndicationRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(162):
        return SubscribeRemoteSubStreamAudioRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(163):
        return SetAudioSubscribeOnlyByRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(164):
        return StartAudioMixingRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(165):
        return PlayEffectRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(166):
        return SetCameraPositionRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(167):
        return AddOrUpdateLiveStreamTaskRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(168):
        return DeleteLiveStreamTaskRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(169):
        return SendSEIMsgRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(170):
        return SetLocalVoiceEqualizationRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(171):
        return SwitchChannelRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(172):
        return StartAudioRecordingRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(173):
        return AudioRecordingConfigurationRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(174):
        return SetLocalMediaPriorityRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(175):
        return StartOrUpdateChannelMediaRelayRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(176):
        return AdjustUserPlaybackSignalVolumeRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(177):
        return EnableEncryptionRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(178):
        return SetLocalVoiceReverbParamRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(179):
        return ReportCustomEventRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(180):
        return StartLastmileProbeTestRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(181):
        return CGPoint.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(182):
        return SetVideoCorrectionConfigRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(183):
        return EnableVirtualBackgroundRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(184):
        return SetRemoteHighPriorityAudioStreamRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(185):
        return VideoWatermarkImageConfig.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(186):
        return VideoWatermarkTextConfig.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(187):
        return VideoWatermarkTimestampConfig.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(188):
        return VideoWatermarkConfig.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(189):
        return SetLocalVideoWatermarkConfigsRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(190):
        return PositionInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(191):
        return SpatializerRoomProperty.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(192):
        return LocalRecordingConfig.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(193):
        return LocalRecordingLayoutConfig.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(194):
        return LocalRecordingStreamInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(195):
        return NERtcVersion.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(196):
        return VideoFrame.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(197):
        return DataExternalFrame.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(198):
        return AudioExternalFrame.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(199):
        return StreamingRoomInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(200):
        return StartPushStreamingRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(201):
        return StartPlayStreamingRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(202):
        return StartASRCaptionRequest.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(203):
        return SetMultiPathOptionRequest.fromList(super.readValue(buffer) as Object[]);
      default:
        return super.readValueOfType(type, buffer);
    }
  }

  writeValue(stream: ByteBuffer , value: ESObject): ESObject{
    if (value instanceof NERtcVideoWatermarkTypeEnum) {
      stream.writeUint8(this.getByte(129));
      this.writeValue(stream, value == null ? null :  Object.values(NERtcVideoWatermarkType).indexOf(value.index as NERtcVideoWatermarkType));
    } else if (value instanceof NERtcCaptureExtraRotationEnum) {
      stream.writeUint8(this.getByte(130));
      this.writeValue(stream, value == null ? null :  Object.values(NERtcCaptureExtraRotation).indexOf(value.index as NERtcCaptureExtraRotation));
    } else if (value instanceof NERtcUserJoinExtraInfo) {
      stream.writeUint8(this.getByte(131));
      this.writeValue(stream, (value as NERtcUserJoinExtraInfo).toList());
    } else if (value instanceof NERtcUserLeaveExtraInfo) {
      stream.writeUint8(this.getByte(132));
      this.writeValue(stream, (value as NERtcUserLeaveExtraInfo).toList());
    } else if (value instanceof UserJoinedEvent) {
      stream.writeUint8(this.getByte(133));
      this.writeValue(stream, (value as UserJoinedEvent).toList());
    } else if (value instanceof UserLeaveEvent) {
      stream.writeUint8(this.getByte(134));
      this.writeValue(stream, (value as UserLeaveEvent).toList());
    } else if (value instanceof UserVideoMuteEvent) {
      stream.writeUint8(this.getByte(135));
      this.writeValue(stream, (value as UserVideoMuteEvent).toList());
    } else if (value instanceof FirstVideoDataReceivedEvent) {
      stream.writeUint8(this.getByte(136));
      this.writeValue(stream, (value as FirstVideoDataReceivedEvent).toList());
    } else if (value instanceof FirstVideoFrameDecodedEvent) {
      stream.writeUint8(this.getByte(137));
      this.writeValue(stream, (value as FirstVideoFrameDecodedEvent).toList());
    } else if (value instanceof VirtualBackgroundSourceEnabledEvent) {
      stream.writeUint8(this.getByte(138));
      this.writeValue(stream, (value as VirtualBackgroundSourceEnabledEvent).toList());
    } else if (value instanceof AudioVolumeInfo) {
      stream.writeUint8(this.getByte(139));
      this.writeValue(stream, (value as AudioVolumeInfo).toList());
    } else if (value instanceof RemoteAudioVolumeIndicationEvent) {
      stream.writeUint8(this.getByte(140));
      this.writeValue(stream, (value as RemoteAudioVolumeIndicationEvent).toList());
    } else if (value instanceof Rectangle) {
      stream.writeUint8(this.getByte(141));
      this.writeValue(stream, (value as Rectangle).toList());
    } else if (value instanceof ScreenCaptureSourceData) {
      stream.writeUint8(this.getByte(142));
      this.writeValue(stream, (value as ScreenCaptureSourceData).toList());
    } else if (value instanceof NERtcLastmileProbeResult) {
      stream.writeUint8(this.getByte(143));
      this.writeValue(stream, (value as NERtcLastmileProbeResult).toList());
    } else if (value instanceof NERtcLastmileProbeOneWayResult) {
      stream.writeUint8(this.getByte(144));
      this.writeValue(stream, (value as NERtcLastmileProbeOneWayResult).toList());
    } else if (value instanceof RtcServerAddresses) {
      stream.writeUint8(this.getByte(145));
      this.writeValue(stream, (value as RtcServerAddresses).toList());
    } else if (value instanceof CreateEngineRequest) {
      stream.writeUint8(this.getByte(146));
      this.writeValue(stream, (value as CreateEngineRequest).toList());
    } else if (value instanceof JoinChannelOptions) {
      stream.writeUint8(this.getByte(147));
      this.writeValue(stream, (value as JoinChannelOptions).toList());
    } else if (value instanceof JoinChannelRequest) {
      stream.writeUint8(this.getByte(148));
      this.writeValue(stream, (value as JoinChannelRequest).toList());
    } else if (value instanceof NERtcLLMRequestParams) {
      stream.writeUint8(this.getByte(149));
      this.writeValue(stream, (value as NERtcLLMRequestParams).toList());
    } else if (value instanceof NERtcLLMRequestResult) {
      stream.writeUint8(this.getByte(150));
      this.writeValue(stream, (value as NERtcLLMRequestResult).toList());
    } else if (value instanceof RequestLLMRequest) {
      stream.writeUint8(this.getByte(151));
      this.writeValue(stream, (value as RequestLLMRequest).toList());
    } else if (value instanceof SubscribeRemoteAudioRequest) {
      stream.writeUint8(this.getByte(152));
      this.writeValue(stream, (value as SubscribeRemoteAudioRequest).toList());
    } else if (value instanceof EnableLocalVideoRequest) {
      stream.writeUint8(this.getByte(153));
      this.writeValue(stream, (value as EnableLocalVideoRequest).toList());
    } else if (value instanceof SetAudioProfileRequest) {
      stream.writeUint8(this.getByte(154));
      this.writeValue(stream, (value as SetAudioProfileRequest).toList());
    } else if (value instanceof SetLocalVideoConfigRequest) {
      stream.writeUint8(this.getByte(155));
      this.writeValue(stream, (value as SetLocalVideoConfigRequest).toList());
    } else if (value instanceof SetCameraCaptureConfigRequest) {
      stream.writeUint8(this.getByte(156));
      this.writeValue(stream, (value as SetCameraCaptureConfigRequest).toList());
    } else if (value instanceof StartorStopVideoPreviewRequest) {
      stream.writeUint8(this.getByte(157));
      this.writeValue(stream, (value as StartorStopVideoPreviewRequest).toList());
    } else if (value instanceof StartScreenCaptureRequest) {
      stream.writeUint8(this.getByte(158));
      this.writeValue(stream, (value as StartScreenCaptureRequest).toList());
    } else if (value instanceof SubscribeRemoteVideoStreamRequest) {
      stream.writeUint8(this.getByte(159));
      this.writeValue(stream, (value as SubscribeRemoteVideoStreamRequest).toList());
    } else if (value instanceof SubscribeRemoteSubStreamVideoRequest) {
      stream.writeUint8(this.getByte(160));
      this.writeValue(stream, (value as SubscribeRemoteSubStreamVideoRequest).toList());
    } else if (value instanceof EnableAudioVolumeIndicationRequest) {
      stream.writeUint8(this.getByte(161));
      this.writeValue(stream, (value as EnableAudioVolumeIndicationRequest).toList());
    } else if (value instanceof SubscribeRemoteSubStreamAudioRequest) {
      stream.writeUint8(this.getByte(162));
      this.writeValue(stream, (value as SubscribeRemoteSubStreamAudioRequest).toList());
    } else if (value instanceof SetAudioSubscribeOnlyByRequest) {
      stream.writeUint8(this.getByte(163));
      this.writeValue(stream, (value as SetAudioSubscribeOnlyByRequest).toList());
    } else if (value instanceof StartAudioMixingRequest) {
      stream.writeUint8(this.getByte(164));
      this.writeValue(stream, (value as StartAudioMixingRequest).toList());
    } else if (value instanceof PlayEffectRequest) {
      stream.writeUint8(this.getByte(165));
      this.writeValue(stream, (value as PlayEffectRequest).toList());
    } else if (value instanceof SetCameraPositionRequest) {
      stream.writeUint8(this.getByte(166));
      this.writeValue(stream, (value as SetCameraPositionRequest).toList());
    } else if (value instanceof AddOrUpdateLiveStreamTaskRequest) {
      stream.writeUint8(this.getByte(167));
      this.writeValue(stream, (value as AddOrUpdateLiveStreamTaskRequest).toList());
    } else if (value instanceof DeleteLiveStreamTaskRequest) {
      stream.writeUint8(this.getByte(168));
      this.writeValue(stream, (value as DeleteLiveStreamTaskRequest).toList());
    } else if (value instanceof SendSEIMsgRequest) {
      stream.writeUint8(this.getByte(169));
      this.writeValue(stream, (value as SendSEIMsgRequest).toList());
    } else if (value instanceof SetLocalVoiceEqualizationRequest) {
      stream.writeUint8(this.getByte(170));
      this.writeValue(stream, (value as SetLocalVoiceEqualizationRequest).toList());
    } else if (value instanceof SwitchChannelRequest) {
      stream.writeUint8(this.getByte(171));
      this.writeValue(stream, (value as SwitchChannelRequest).toList());
    } else if (value instanceof StartAudioRecordingRequest) {
      stream.writeUint8(this.getByte(172));
      this.writeValue(stream, (value as StartAudioRecordingRequest).toList());
    } else if (value instanceof AudioRecordingConfigurationRequest) {
      stream.writeUint8(this.getByte(173));
      this.writeValue(stream, (value as AudioRecordingConfigurationRequest).toList());
    } else if (value instanceof SetLocalMediaPriorityRequest) {
      stream.writeUint8(this.getByte(174));
      this.writeValue(stream, (value as SetLocalMediaPriorityRequest).toList());
    } else if (value instanceof StartOrUpdateChannelMediaRelayRequest) {
      stream.writeUint8(this.getByte(175));
      this.writeValue(stream, (value as StartOrUpdateChannelMediaRelayRequest).toList());
    } else if (value instanceof AdjustUserPlaybackSignalVolumeRequest) {
      stream.writeUint8(this.getByte(176));
      this.writeValue(stream, (value as AdjustUserPlaybackSignalVolumeRequest).toList());
    } else if (value instanceof EnableEncryptionRequest) {
      stream.writeUint8(this.getByte(177));
      this.writeValue(stream, (value as EnableEncryptionRequest).toList());
    } else if (value instanceof SetLocalVoiceReverbParamRequest) {
      stream.writeUint8(this.getByte(178));
      this.writeValue(stream, (value as SetLocalVoiceReverbParamRequest).toList());
    } else if (value instanceof ReportCustomEventRequest) {
      stream.writeUint8(this.getByte(179));
      this.writeValue(stream, (value as ReportCustomEventRequest).toList());
    } else if (value instanceof StartLastmileProbeTestRequest) {
      stream.writeUint8(this.getByte(180));
      this.writeValue(stream, (value as StartLastmileProbeTestRequest).toList());
    } else if (value instanceof CGPoint) {
      stream.writeUint8(this.getByte(181));
      this.writeValue(stream, (value as CGPoint).toList());
    } else if (value instanceof SetVideoCorrectionConfigRequest) {
      stream.writeUint8(this.getByte(182));
      this.writeValue(stream, (value as SetVideoCorrectionConfigRequest).toList());
    } else if (value instanceof EnableVirtualBackgroundRequest) {
      stream.writeUint8(this.getByte(183));
      this.writeValue(stream, (value as EnableVirtualBackgroundRequest).toList());
    } else if (value instanceof SetRemoteHighPriorityAudioStreamRequest) {
      stream.writeUint8(this.getByte(184));
      this.writeValue(stream, (value as SetRemoteHighPriorityAudioStreamRequest).toList());
    } else if (value instanceof VideoWatermarkImageConfig) {
      stream.writeUint8(this.getByte(185));
      this.writeValue(stream, (value as VideoWatermarkImageConfig).toList());
    } else if (value instanceof VideoWatermarkTextConfig) {
      stream.writeUint8(this.getByte(186));
      this.writeValue(stream, (value as VideoWatermarkTextConfig).toList());
    } else if (value instanceof VideoWatermarkTimestampConfig) {
      stream.writeUint8(this.getByte(187));
      this.writeValue(stream, (value as VideoWatermarkTimestampConfig).toList());
    } else if (value instanceof VideoWatermarkConfig) {
      stream.writeUint8(this.getByte(188));
      this.writeValue(stream, (value as VideoWatermarkConfig).toList());
    } else if (value instanceof SetLocalVideoWatermarkConfigsRequest) {
      stream.writeUint8(this.getByte(189));
      this.writeValue(stream, (value as SetLocalVideoWatermarkConfigsRequest).toList());
    } else if (value instanceof PositionInfo) {
      stream.writeUint8(this.getByte(190));
      this.writeValue(stream, (value as PositionInfo).toList());
    } else if (value instanceof SpatializerRoomProperty) {
      stream.writeUint8(this.getByte(191));
      this.writeValue(stream, (value as SpatializerRoomProperty).toList());
    } else if (value instanceof LocalRecordingConfig) {
      stream.writeUint8(this.getByte(192));
      this.writeValue(stream, (value as LocalRecordingConfig).toList());
    } else if (value instanceof LocalRecordingLayoutConfig) {
      stream.writeUint8(this.getByte(193));
      this.writeValue(stream, (value as LocalRecordingLayoutConfig).toList());
    } else if (value instanceof LocalRecordingStreamInfo) {
      stream.writeUint8(this.getByte(194));
      this.writeValue(stream, (value as LocalRecordingStreamInfo).toList());
    } else if (value instanceof NERtcVersion) {
      stream.writeUint8(this.getByte(195));
      this.writeValue(stream, (value as NERtcVersion).toList());
    } else if (value instanceof VideoFrame) {
      stream.writeUint8(this.getByte(196));
      this.writeValue(stream, (value as VideoFrame).toList());
    } else if (value instanceof DataExternalFrame) {
      stream.writeUint8(this.getByte(197));
      this.writeValue(stream, (value as DataExternalFrame).toList());
    } else if (value instanceof AudioExternalFrame) {
      stream.writeUint8(this.getByte(198));
      this.writeValue(stream, (value as AudioExternalFrame).toList());
    } else if (value instanceof StreamingRoomInfo) {
      stream.writeUint8(this.getByte(199));
      this.writeValue(stream, (value as StreamingRoomInfo).toList());
    } else if (value instanceof StartPushStreamingRequest) {
      stream.writeUint8(this.getByte(200));
      this.writeValue(stream, (value as StartPushStreamingRequest).toList());
    } else if (value instanceof StartPlayStreamingRequest) {
      stream.writeUint8(this.getByte(201));
      this.writeValue(stream, (value as StartPlayStreamingRequest).toList());
    } else if (value instanceof StartASRCaptionRequest) {
      stream.writeUint8(this.getByte(202));
      this.writeValue(stream, (value as StartASRCaptionRequest).toList());
    } else if (value instanceof SetMultiPathOptionRequest) {
      stream.writeUint8(this.getByte(203));
      this.writeValue(stream, (value as SetMultiPathOptionRequest).toList());
    } else {
      super.writeValue(stream, value);
    }
  }
}


export interface Result<T> {
  success( result: T ): void;

  error( error: Error): void;
}
/* Generated class from Pigeon that represents Flutter messages that can be called from ArkTS.*/
export class NERtcSubChannelEventSink {
  binaryMessenger: BinaryMessenger;

  constructor(binaryMessenger: BinaryMessenger) {
    this.binaryMessenger = binaryMessenger;
  }

  /** The codec used by NERtcSubChannelEventSink. */
  static getCodec(): MessageCodec<Object> {
    return PigeonCodec.INSTANCE;
  }

  onJoinChannel(channelTagArg: string,resultArg: number,channelIdArg: number,elapsedArg: number,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onJoinChannel';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg, channelIdArg, elapsedArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLeaveChannel(channelTagArg: string,resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLeaveChannel';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserJoined(channelTagArg: string,eventArg: UserJoinedEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserJoined';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserLeave(channelTagArg: string,eventArg: UserLeaveEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserLeave';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserAudioStart(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserAudioStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamAudioStart(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserSubStreamAudioStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserAudioStop(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserAudioStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamAudioStop(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserSubStreamAudioStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoStart(channelTagArg: string,uidArg: number,maxProfileArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserVideoStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, maxProfileArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoStop(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserVideoStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onDisconnect(channelTagArg: string,reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onDisconnect';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserAudioMute(channelTagArg: string,uidArg: number,mutedArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserAudioMute';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, mutedArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoMute(channelTagArg: string,eventArg: UserVideoMuteEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserVideoMute';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamAudioMute(channelTagArg: string,uidArg: number,mutedArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserSubStreamAudioMute';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, mutedArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstAudioDataReceived(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onFirstAudioDataReceived';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstVideoDataReceived(channelTagArg: string,eventArg: FirstVideoDataReceivedEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onFirstVideoDataReceived';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstAudioFrameDecoded(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onFirstAudioFrameDecoded';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstVideoFrameDecoded(channelTagArg: string,eventArg: FirstVideoFrameDecodedEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onFirstVideoFrameDecoded';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onVirtualBackgroundSourceEnabled(channelTagArg: string,eventArg: VirtualBackgroundSourceEnabledEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onVirtualBackgroundSourceEnabled';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onConnectionTypeChanged(channelTagArg: string,newConnectionTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onConnectionTypeChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, newConnectionTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onReconnectingStart(channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onReconnectingStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onReJoinChannel(channelTagArg: string,resultArg: number,channelIdArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onReJoinChannel';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg, channelIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onConnectionStateChanged(channelTagArg: string,stateArg: number,reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onConnectionStateChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, stateArg, reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalAudioVolumeIndication(channelTagArg: string,volumeArg: number,vadFlagArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLocalAudioVolumeIndication';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, volumeArg, vadFlagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteAudioVolumeIndication(channelTagArg: string,eventArg: RemoteAudioVolumeIndicationEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onRemoteAudioVolumeIndication';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLiveStreamState(channelTagArg: string,taskIdArg: string,pushUrlArg: string,liveStateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLiveStreamState';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, taskIdArg, pushUrlArg, liveStateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onClientRoleChange(channelTagArg: string,oldRoleArg: number,newRoleArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onClientRoleChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, oldRoleArg, newRoleArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onError(channelTagArg: string,codeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onError';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, codeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onWarning(channelTagArg: string,codeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onWarning';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, codeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamVideoStart(channelTagArg: string,uidArg: number,maxProfileArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserSubStreamVideoStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, maxProfileArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamVideoStop(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserSubStreamVideoStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioHasHowling(channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onAudioHasHowling';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRecvSEIMsg(channelTagArg: string,userIDArg: number,seiMsgArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onRecvSEIMsg';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, userIDArg, seiMsgArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioRecording(channelTagArg: string,codeArg: number,filePathArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onAudioRecording';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, codeArg, filePathArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onMediaRightChange(channelTagArg: string,isAudioBannedByServerArg: boolean,isVideoBannedByServerArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onMediaRightChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, isAudioBannedByServerArg, isVideoBannedByServerArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onMediaRelayStatesChange(channelTagArg: string,stateArg: number,channelNameArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onMediaRelayStatesChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, stateArg, channelNameArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onMediaRelayReceiveEvent(channelTagArg: string,eventArg: number,codeArg: number,channelNameArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onMediaRelayReceiveEvent';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, eventArg, codeArg, channelNameArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalPublishFallbackToAudioOnly(channelTagArg: string,isFallbackArg: boolean,streamTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLocalPublishFallbackToAudioOnly';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, isFallbackArg, streamTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteSubscribeFallbackToAudioOnly(channelTagArg: string,uidArg: number,isFallbackArg: boolean,streamTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onRemoteSubscribeFallbackToAudioOnly';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, isFallbackArg, streamTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalVideoWatermarkState(channelTagArg: string,videoStreamTypeArg: number,stateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLocalVideoWatermarkState';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, videoStreamTypeArg, stateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLastmileQuality(channelTagArg: string,qualityArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLastmileQuality';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, qualityArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLastmileProbeResult(channelTagArg: string,resultArg: NERtcLastmileProbeResult, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLastmileProbeResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onTakeSnapshotResult(channelTagArg: string,codeArg: number,pathArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onTakeSnapshotResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, codeArg, pathArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPermissionKeyWillExpire(channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onPermissionKeyWillExpire';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUpdatePermissionKey(channelTagArg: string,keyArg: string,errorArg: number,timeoutArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUpdatePermissionKey';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, keyArg, errorArg, timeoutArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAsrCaptionStateChanged(channelTagArg: string,asrStateArg: number,codeArg: number,messageArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onAsrCaptionStateChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, asrStateArg, codeArg, messageArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAsrCaptionResult(channelTagArg: string,resultArg: Array<Map<Object, Object>>,resultCountArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onAsrCaptionResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg, resultCountArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingStateChange(channelTagArg: string,streamIdArg: string,stateArg: number,reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onPlayStreamingStateChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, streamIdArg, stateArg, reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingReceiveSeiMessage(channelTagArg: string,streamIdArg: string,messageArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onPlayStreamingReceiveSeiMessage';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, streamIdArg, messageArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingFirstAudioFramePlayed(channelTagArg: string,streamIdArg: string,timeMsArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onPlayStreamingFirstAudioFramePlayed';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, streamIdArg, timeMsArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingFirstVideoFrameRender(channelTagArg: string,streamIdArg: string,timeMsArg: number,widthArg: number,heightArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onPlayStreamingFirstVideoFrameRender';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, streamIdArg, timeMsArg, widthArg, heightArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalAudioFirstPacketSent(channelTagArg: string,audioStreamTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLocalAudioFirstPacketSent';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, audioStreamTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstVideoFrameRender(channelTagArg: string,userIDArg: number,streamTypeArg: number,widthArg: number,heightArg: number,elapsedTimeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onFirstVideoFrameRender';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, userIDArg, streamTypeArg, widthArg, heightArg, elapsedTimeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalVideoRenderSizeChanged(channelTagArg: string,videoTypeArg: number,widthArg: number,heightArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLocalVideoRenderSizeChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, videoTypeArg, widthArg, heightArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoProfileUpdate(channelTagArg: string,uidArg: number,maxProfileArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserVideoProfileUpdate';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, maxProfileArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioDeviceChanged(channelTagArg: string,selectedArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onAudioDeviceChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, selectedArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioDeviceStateChange(channelTagArg: string,deviceTypeArg: number,deviceStateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onAudioDeviceStateChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, deviceTypeArg, deviceStateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onApiCallExecuted(channelTagArg: string,apiNameArg: string,resultArg: number,messageArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onApiCallExecuted';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, apiNameArg, resultArg, messageArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteVideoSizeChanged(channelTagArg: string,userIdArg: number,videoTypeArg: number,widthArg: number,heightArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onRemoteVideoSizeChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, userIdArg, videoTypeArg, widthArg, heightArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataStart(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserDataStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataStop(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserDataStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataReceiveMessage(channelTagArg: string,uidArg: number,bufferDataArg: number[],bufferSizeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserDataReceiveMessage';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, bufferDataArg, bufferSizeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataStateChanged(channelTagArg: string,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserDataStateChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataBufferedAmountChanged(channelTagArg: string,uidArg: number,previousAmountArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onUserDataBufferedAmountChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, uidArg, previousAmountArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLabFeatureCallback(channelTagArg: string,keyArg: string,paramArg: Map<Object, Object>, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLabFeatureCallback';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, keyArg, paramArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAiData(channelTagArg: string,typeArg: string,dataArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onAiData';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, typeArg, dataArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onStartPushStreaming(channelTagArg: string,resultArg: number,channelIdArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onStartPushStreaming';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg, channelIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onStopPushStreaming(channelTagArg: string,resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onStopPushStreaming';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPushStreamingReconnecting(channelTagArg: string,reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onPushStreamingReconnecting';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPushStreamingReconnectedSuccess(channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onPushStreamingReconnectedSuccess';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onReleasedHwResources(channelTagArg: string,resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onReleasedHwResources';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onScreenCaptureStatus(channelTagArg: string,statusArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onScreenCaptureStatus';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, statusArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onScreenCaptureSourceDataUpdate(channelTagArg: string,dataArg: ScreenCaptureSourceData, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onScreenCaptureSourceDataUpdate';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, dataArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalRecorderStatus(channelTagArg: string,statusArg: number,taskIdArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLocalRecorderStatus';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, statusArg, taskIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalRecorderError(channelTagArg: string,errorArg: number,taskIdArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onLocalRecorderError';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, errorArg, taskIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onCheckNECastAudioDriverResult(channelTagArg: string,resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcSubChannelEventSink.onCheckNECastAudioDriverResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcSubChannelEventSink.getCodec());
    channel.send(
        [channelTagArg, resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
}
/* Generated class from Pigeon that represents Flutter messages that can be called from ArkTS.*/
export class NERtcChannelEventSink {
  binaryMessenger: BinaryMessenger;

  constructor(binaryMessenger: BinaryMessenger) {
    this.binaryMessenger = binaryMessenger;
  }

  /** The codec used by NERtcChannelEventSink. */
  static getCodec(): MessageCodec<Object> {
    return PigeonCodec.INSTANCE;
  }

  onJoinChannel(resultArg: number,channelIdArg: number,elapsedArg: number,uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onJoinChannel';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg, channelIdArg, elapsedArg, uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLeaveChannel(resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLeaveChannel';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserJoined(eventArg: UserJoinedEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserJoined';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserLeave(eventArg: UserLeaveEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserLeave';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserAudioStart(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserAudioStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamAudioStart(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserSubStreamAudioStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserAudioStop(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserAudioStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamAudioStop(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserSubStreamAudioStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoStart(uidArg: number,maxProfileArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserVideoStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, maxProfileArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoStop(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserVideoStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onDisconnect(reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onDisconnect';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserAudioMute(uidArg: number,mutedArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserAudioMute';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, mutedArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoMute(eventArg: UserVideoMuteEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserVideoMute';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamAudioMute(uidArg: number,mutedArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserSubStreamAudioMute';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, mutedArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstAudioDataReceived(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onFirstAudioDataReceived';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstVideoDataReceived(eventArg: FirstVideoDataReceivedEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onFirstVideoDataReceived';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstAudioFrameDecoded(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onFirstAudioFrameDecoded';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstVideoFrameDecoded(eventArg: FirstVideoFrameDecodedEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onFirstVideoFrameDecoded';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onVirtualBackgroundSourceEnabled(eventArg: VirtualBackgroundSourceEnabledEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onVirtualBackgroundSourceEnabled';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onConnectionTypeChanged(newConnectionTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onConnectionTypeChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [newConnectionTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onReconnectingStart(callback: Reply<void>):void {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onReconnectingStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        null,
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onReJoinChannel(resultArg: number,channelIdArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onReJoinChannel';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg, channelIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onConnectionStateChanged(stateArg: number,reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onConnectionStateChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [stateArg, reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalAudioVolumeIndication(volumeArg: number,vadFlagArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLocalAudioVolumeIndication';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [volumeArg, vadFlagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteAudioVolumeIndication(eventArg: RemoteAudioVolumeIndicationEvent, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onRemoteAudioVolumeIndication';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLiveStreamState(taskIdArg: string,pushUrlArg: string,liveStateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLiveStreamState';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [taskIdArg, pushUrlArg, liveStateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onClientRoleChange(oldRoleArg: number,newRoleArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onClientRoleChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [oldRoleArg, newRoleArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onError(codeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onError';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [codeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onWarning(codeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onWarning';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [codeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamVideoStart(uidArg: number,maxProfileArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserSubStreamVideoStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, maxProfileArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserSubStreamVideoStop(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserSubStreamVideoStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioHasHowling(callback: Reply<void>):void {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onAudioHasHowling';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        null,
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRecvSEIMsg(userIDArg: number,seiMsgArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onRecvSEIMsg';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [userIDArg, seiMsgArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioRecording(codeArg: number,filePathArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onAudioRecording';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [codeArg, filePathArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onMediaRightChange(isAudioBannedByServerArg: boolean,isVideoBannedByServerArg: boolean, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onMediaRightChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [isAudioBannedByServerArg, isVideoBannedByServerArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onMediaRelayStatesChange(stateArg: number,channelNameArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onMediaRelayStatesChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [stateArg, channelNameArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onMediaRelayReceiveEvent(eventArg: number,codeArg: number,channelNameArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onMediaRelayReceiveEvent';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [eventArg, codeArg, channelNameArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalPublishFallbackToAudioOnly(isFallbackArg: boolean,streamTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLocalPublishFallbackToAudioOnly';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [isFallbackArg, streamTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteSubscribeFallbackToAudioOnly(uidArg: number,isFallbackArg: boolean,streamTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onRemoteSubscribeFallbackToAudioOnly';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, isFallbackArg, streamTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalVideoWatermarkState(videoStreamTypeArg: number,stateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLocalVideoWatermarkState';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [videoStreamTypeArg, stateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLastmileQuality(qualityArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLastmileQuality';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [qualityArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLastmileProbeResult(resultArg: NERtcLastmileProbeResult, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLastmileProbeResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onTakeSnapshotResult(codeArg: number,pathArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onTakeSnapshotResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [codeArg, pathArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPermissionKeyWillExpire(callback: Reply<void>):void {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onPermissionKeyWillExpire';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        null,
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUpdatePermissionKey(keyArg: string,errorArg: number,timeoutArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUpdatePermissionKey';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [keyArg, errorArg, timeoutArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAsrCaptionStateChanged(asrStateArg: number,codeArg: number,messageArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onAsrCaptionStateChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [asrStateArg, codeArg, messageArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAsrCaptionResult(resultArg: Array<Map<Object, Object>>,resultCountArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onAsrCaptionResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg, resultCountArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingStateChange(streamIdArg: string,stateArg: number,reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onPlayStreamingStateChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [streamIdArg, stateArg, reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingReceiveSeiMessage(streamIdArg: string,messageArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onPlayStreamingReceiveSeiMessage';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [streamIdArg, messageArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingFirstAudioFramePlayed(streamIdArg: string,timeMsArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onPlayStreamingFirstAudioFramePlayed';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [streamIdArg, timeMsArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPlayStreamingFirstVideoFrameRender(streamIdArg: string,timeMsArg: number,widthArg: number,heightArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onPlayStreamingFirstVideoFrameRender';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [streamIdArg, timeMsArg, widthArg, heightArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalAudioFirstPacketSent(audioStreamTypeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLocalAudioFirstPacketSent';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [audioStreamTypeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onFirstVideoFrameRender(userIDArg: number,streamTypeArg: number,widthArg: number,heightArg: number,elapsedTimeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onFirstVideoFrameRender';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [userIDArg, streamTypeArg, widthArg, heightArg, elapsedTimeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalVideoRenderSizeChanged(videoTypeArg: number,widthArg: number,heightArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLocalVideoRenderSizeChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [videoTypeArg, widthArg, heightArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserVideoProfileUpdate(uidArg: number,maxProfileArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserVideoProfileUpdate';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, maxProfileArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioDeviceChanged(selectedArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onAudioDeviceChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [selectedArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioDeviceStateChange(deviceTypeArg: number,deviceStateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onAudioDeviceStateChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [deviceTypeArg, deviceStateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onApiCallExecuted(apiNameArg: string,resultArg: number,messageArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onApiCallExecuted';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [apiNameArg, resultArg, messageArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteVideoSizeChanged(userIdArg: number,videoTypeArg: number,widthArg: number,heightArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onRemoteVideoSizeChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [userIdArg, videoTypeArg, widthArg, heightArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataStart(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserDataStart';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataStop(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserDataStop';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataReceiveMessage(uidArg: number,bufferDataArg: number[],bufferSizeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserDataReceiveMessage';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, bufferDataArg, bufferSizeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataStateChanged(uidArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserDataStateChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onUserDataBufferedAmountChanged(uidArg: number,previousAmountArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onUserDataBufferedAmountChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [uidArg, previousAmountArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLabFeatureCallback(keyArg: string,paramArg: Map<Object, Object>, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLabFeatureCallback';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [keyArg, paramArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAiData(typeArg: string,dataArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onAiData';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [typeArg, dataArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onStartPushStreaming(resultArg: number,channelIdArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onStartPushStreaming';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg, channelIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onStopPushStreaming(resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onStopPushStreaming';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPushStreamingReconnecting(reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onPushStreamingReconnecting';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onPushStreamingReconnectedSuccess(callback: Reply<void>):void {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onPushStreamingReconnectedSuccess';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        null,
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onReleasedHwResources(resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onReleasedHwResources';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onScreenCaptureStatus(statusArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onScreenCaptureStatus';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [statusArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onScreenCaptureSourceDataUpdate(dataArg: ScreenCaptureSourceData, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onScreenCaptureSourceDataUpdate';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [dataArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalRecorderStatus(statusArg: number,taskIdArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLocalRecorderStatus';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [statusArg, taskIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalRecorderError(errorArg: number,taskIdArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onLocalRecorderError';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [errorArg, taskIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onCheckNECastAudioDriverResult(resultArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcChannelEventSink.onCheckNECastAudioDriverResult';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcChannelEventSink.getCodec());
    channel.send(
        [resultArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class ChannelApi {

  getChannelName(channelTag: string ): string { return ""; }

  setStatsEventCallback(channelTag: string ): number { return 30004; }

  clearStatsEventCallback(channelTag: string ): number { return 30004; }

  setChannelProfile(channelTag: string , channelProfile: number ): number { return 30004; }

  enableMediaPub(channelTag: string , mediaType: number , enable: boolean ): number { return 30004; }

  joinChannel(channelTag: string , request: JoinChannelRequest ): number { return 30004; }

  leaveChannel(channelTag: string ): number { return 30004; }

  setClientRole(channelTag: string , role: number ): number { return 30004; }

  getConnectionState(channelTag: string ): number { return 30004; }

  release(channelTag: string ): number { return 30004; }

  enableLocalAudio(channelTag: string , enable: boolean ): number { return 30004; }

  muteLocalAudioStream(channelTag: string , mute: boolean ): number { return 30004; }

  subscribeRemoteAudio(channelTag: string , uid: number , subscribe: boolean ): number { return 30004; }

  subscribeRemoteSubAudio(channelTag: string , uid: number , subscribe: boolean ): number { return 30004; }

  setLocalVideoConfig(channelTag: string , request: SetLocalVideoConfigRequest ): number { return 30004; }

  enableLocalVideo(channelTag: string , request: EnableLocalVideoRequest ): number { return 30004; }

  muteLocalVideoStream(channelTag: string , mute: boolean , streamType: number ): number { return 30004; }

  switchCamera(channelTag: string ): number { return 30004; }

  subscribeRemoteVideoStream(channelTag: string , request: SubscribeRemoteVideoStreamRequest ): number { return 30004; }

  subscribeRemoteSubVideoStream(channelTag: string , uid: number , subscribe: boolean ): number { return 30004; }

  enableAudioVolumeIndication(channelTag: string , request: EnableAudioVolumeIndicationRequest ): number { return 30004; }

  takeLocalSnapshot(channelTag: string , streamType: number , path: string ): number { return 30004; }

  takeRemoteSnapshot(channelTag: string , uid: number , streamType: number , path: string ): number { return 30004; }

  subscribeAllRemoteAudio(channelTag: string , subscribe: boolean ): number { return 30004; }

  setCameraCaptureConfig(channelTag: string , request: SetCameraCaptureConfigRequest ): number { return 30004; }

  setVideoStreamLayerCount(channelTag: string , layerCount: number ): number { return 30004; }

  getFeatureSupportedType(channelTag: string , type: number ): number { return 30004; }

  switchCameraWithPosition(channelTag: string , position: number ): number { return 30004; }

  startScreenCapture(channelTag: string , request: StartScreenCaptureRequest , result: Result<number>): void { result.success(30004); }

  stopScreenCapture(channelTag: string ): number { return 30004; }

  enableLoopbackRecording(channelTag: string , enable: boolean ): number { return 30004; }

  adjustLoopBackRecordingSignalVolume(channelTag: string , volume: number ): number { return 30004; }

  setExternalVideoSource(channelTag: string , streamType: number , enable: boolean ): number { return 30004; }

  pushExternalVideoFrame(channelTag: string , streamType: number , frame: VideoFrame ): number { return 30004; }

  addLiveStreamTask(channelTag: string , request: AddOrUpdateLiveStreamTaskRequest ): number { return 30004; }

  updateLiveStreamTask(channelTag: string , request: AddOrUpdateLiveStreamTaskRequest ): number { return 30004; }

  removeLiveStreamTask(channelTag: string , request: DeleteLiveStreamTaskRequest ): number { return 30004; }

  sendSEIMsg(channelTag: string , request: SendSEIMsgRequest ): number { return 30004; }

  setLocalMediaPriority(channelTag: string , request: SetLocalMediaPriorityRequest ): number { return 30004; }

  startChannelMediaRelay(channelTag: string , request: StartOrUpdateChannelMediaRelayRequest ): number { return 30004; }

  updateChannelMediaRelay(channelTag: string , request: StartOrUpdateChannelMediaRelayRequest ): number { return 30004; }

  stopChannelMediaRelay(channelTag: string ): number { return 30004; }

  adjustUserPlaybackSignalVolume(channelTag: string , request: AdjustUserPlaybackSignalVolumeRequest ): number { return 30004; }

  setLocalPublishFallbackOption(channelTag: string , option: number ): number { return 30004; }

  setRemoteSubscribeFallbackOption(channelTag: string , option: number ): number { return 30004; }

  enableEncryption(channelTag: string , request: EnableEncryptionRequest ): number { return 30004; }

  setRemoteHighPriorityAudioStream(channelTag: string , request: SetRemoteHighPriorityAudioStreamRequest ): number { return 30004; }

  setAudioSubscribeOnlyBy(channelTag: string , request: SetAudioSubscribeOnlyByRequest ): number { return 30004; }

  enableLocalSubStreamAudio(channelTag: string , enable: boolean ): number { return 30004; }

  enableLocalData(channelTag: string , enabled: boolean ): number { return 30004; }

  subscribeRemoteData(channelTag: string , subscribe: boolean , userID: number ): number { return 30004; }

  sendData(channelTag: string , frame: DataExternalFrame ): number { return 30004; }

  reportCustomEvent(channelTag: string , request: ReportCustomEventRequest ): number { return 30004; }

  setAudioRecvRange(channelTag: string , audibleDistance: number , conversationalDistance: number , rollOffMode: number ): number { return 30004; }

  setRangeAudioMode(channelTag: string , audioMode: number ): number { return 30004; }

  setRangeAudioTeamID(channelTag: string , teamID: number ): number { return 30004; }

  updateSelfPosition(channelTag: string , positionInfo: PositionInfo ): number { return 30004; }

  enableSpatializerRoomEffects(channelTag: string , enable: boolean ): number { return 30004; }

  setSpatializerRoomProperty(channelTag: string , property: SpatializerRoomProperty ): number { return 30004; }

  setSpatializerRenderMode(channelTag: string , renderMode: number ): number { return 30004; }

  enableSpatializer(channelTag: string , enable: boolean , applyToTeam: boolean ): number { return 30004; }

  setUpSpatializer(channelTag: string ): number { return 30004; }

  setSubscribeAudioBlocklist(channelTag: string , uidArray: Array<number> , streamType: number ): number { return 30004; }

  setSubscribeAudioAllowlist(channelTag: string , uidArray: Array<number> ): number { return 30004; }
  /** The codec used by ChannelApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `ChannelApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: ChannelApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.getChannelName", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: string = api!.getChannelName(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setStatsEventCallback", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setStatsEventCallback(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.clearStatsEventCallback", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.clearStatsEventCallback(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setChannelProfile", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setChannelProfile(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableMediaPub", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableMediaPub(args[0] as string, args[1] as number, args[2] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.joinChannel", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.joinChannel(args[0] as string, args[1] as JoinChannelRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.leaveChannel", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.leaveChannel(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setClientRole", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setClientRole(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.getConnectionState", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getConnectionState(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.release", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.release(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableLocalAudio", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalAudio(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.muteLocalAudioStream", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.muteLocalAudioStream(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.subscribeRemoteAudio", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteAudio(args[0] as string, args[1] as number, args[2] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.subscribeRemoteSubAudio", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteSubAudio(args[0] as string, args[1] as number, args[2] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setLocalVideoConfig", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalVideoConfig(args[0] as string, args[1] as SetLocalVideoConfigRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableLocalVideo", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalVideo(args[0] as string, args[1] as EnableLocalVideoRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.muteLocalVideoStream", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.muteLocalVideoStream(args[0] as string, args[1] as boolean, args[2] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.switchCamera", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.switchCamera(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.subscribeRemoteVideoStream", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteVideoStream(args[0] as string, args[1] as SubscribeRemoteVideoStreamRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.subscribeRemoteSubVideoStream", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteSubVideoStream(args[0] as string, args[1] as number, args[2] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableAudioVolumeIndication", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableAudioVolumeIndication(args[0] as string, args[1] as EnableAudioVolumeIndicationRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.takeLocalSnapshot", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.takeLocalSnapshot(args[0] as string, args[1] as number, args[2] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.takeRemoteSnapshot", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.takeRemoteSnapshot(args[0] as string, args[1] as number, args[2] as number, args[3] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.subscribeAllRemoteAudio", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeAllRemoteAudio(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setCameraCaptureConfig", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setCameraCaptureConfig(args[0] as string, args[1] as SetCameraCaptureConfigRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setVideoStreamLayerCount", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setVideoStreamLayerCount(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.getFeatureSupportedType", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getFeatureSupportedType(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.switchCameraWithPosition", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.switchCameraWithPosition(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.startScreenCapture", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<number> = new ResultImp();

              api!.startScreenCapture(args[0] as string, args[1] as StartScreenCaptureRequest, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.stopScreenCapture", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopScreenCapture(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableLoopbackRecording", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLoopbackRecording(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.adjustLoopBackRecordingSignalVolume", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.adjustLoopBackRecordingSignalVolume(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setExternalVideoSource", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setExternalVideoSource(args[0] as string, args[1] as number, args[2] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.pushExternalVideoFrame", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.pushExternalVideoFrame(args[0] as string, args[1] as number, args[2] as VideoFrame);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.addLiveStreamTask", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.addLiveStreamTask(args[0] as string, args[1] as AddOrUpdateLiveStreamTaskRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.updateLiveStreamTask", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateLiveStreamTask(args[0] as string, args[1] as AddOrUpdateLiveStreamTaskRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.removeLiveStreamTask", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.removeLiveStreamTask(args[0] as string, args[1] as DeleteLiveStreamTaskRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.sendSEIMsg", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.sendSEIMsg(args[0] as string, args[1] as SendSEIMsgRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setLocalMediaPriority", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalMediaPriority(args[0] as string, args[1] as SetLocalMediaPriorityRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.startChannelMediaRelay", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startChannelMediaRelay(args[0] as string, args[1] as StartOrUpdateChannelMediaRelayRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.updateChannelMediaRelay", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateChannelMediaRelay(args[0] as string, args[1] as StartOrUpdateChannelMediaRelayRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.stopChannelMediaRelay", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopChannelMediaRelay(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.adjustUserPlaybackSignalVolume", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.adjustUserPlaybackSignalVolume(args[0] as string, args[1] as AdjustUserPlaybackSignalVolumeRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setLocalPublishFallbackOption", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalPublishFallbackOption(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setRemoteSubscribeFallbackOption", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRemoteSubscribeFallbackOption(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableEncryption", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableEncryption(args[0] as string, args[1] as EnableEncryptionRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setRemoteHighPriorityAudioStream", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRemoteHighPriorityAudioStream(args[0] as string, args[1] as SetRemoteHighPriorityAudioStreamRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setAudioSubscribeOnlyBy", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioSubscribeOnlyBy(args[0] as string, args[1] as SetAudioSubscribeOnlyByRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableLocalSubStreamAudio", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalSubStreamAudio(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableLocalData", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalData(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.subscribeRemoteData", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteData(args[0] as string, args[1] as boolean, args[2] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.sendData", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.sendData(args[0] as string, args[1] as DataExternalFrame);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.reportCustomEvent", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.reportCustomEvent(args[0] as string, args[1] as ReportCustomEventRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setAudioRecvRange", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioRecvRange(args[0] as string, args[1] as number, args[2] as number, args[3] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setRangeAudioMode", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRangeAudioMode(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setRangeAudioTeamID", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRangeAudioTeamID(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.updateSelfPosition", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateSelfPosition(args[0] as string, args[1] as PositionInfo);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableSpatializerRoomEffects", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableSpatializerRoomEffects(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setSpatializerRoomProperty", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSpatializerRoomProperty(args[0] as string, args[1] as SpatializerRoomProperty);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setSpatializerRenderMode", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSpatializerRenderMode(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.enableSpatializer", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableSpatializer(args[0] as string, args[1] as boolean, args[2] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setUpSpatializer", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setUpSpatializer(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setSubscribeAudioBlocklist", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSubscribeAudioBlocklist(args[0] as string, args[1] as Array<number>, args[2] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.ChannelApi.setSubscribeAudioAllowlist", ChannelApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSubscribeAudioAllowlist(args[0] as string, args[1] as Array<number>);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class EngineApi {

  create(request: CreateEngineRequest ): number { return 30004; }

  createChannel(channelTag: string ): number { return 30004; }

  version(): NERtcVersion { return new NERtcVersion(); }

  checkPermission(): Array<string> { return []; }

  setParameters(params: Map<string, Object> ): number { return 30004; }

  release(result: Result<number>): void { result.success(30004); }

  setStatsEventCallback(): number { return 30004; }

  clearStatsEventCallback(): number { return 30004; }

  setChannelProfile(channelProfile: number ): number { return 30004; }

  joinChannel(request: JoinChannelRequest ): number { return 30004; }

  leaveChannel(): number { return 30004; }

  updatePermissionKey(key: string ): number { return 30004; }

  enableLocalAudio(enable: boolean ): number { return 30004; }

  subscribeRemoteAudio(request: SubscribeRemoteAudioRequest ): number { return 30004; }

  subscribeAllRemoteAudio(subscribe: boolean ): number { return 30004; }

  setAudioProfile(request: SetAudioProfileRequest ): number { return 30004; }

  enableDualStreamMode(enable: boolean ): number { return 30004; }

  setLocalVideoConfig(request: SetLocalVideoConfigRequest ): number { return 30004; }

  setCameraCaptureConfig(request: SetCameraCaptureConfigRequest ): number { return 30004; }

  setVideoRotationMode(rotationMode: number ): number { return 30004; }

  startVideoPreview(request: StartorStopVideoPreviewRequest ): number { return 30004; }

  stopVideoPreview(request: StartorStopVideoPreviewRequest ): number { return 30004; }

  enableLocalVideo(request: EnableLocalVideoRequest ): number { return 30004; }

  enableLocalSubStreamAudio(enable: boolean ): number { return 30004; }

  subscribeRemoteSubStreamAudio(request: SubscribeRemoteSubStreamAudioRequest ): number { return 30004; }

  muteLocalSubStreamAudio(muted: boolean ): number { return 30004; }

  setAudioSubscribeOnlyBy(request: SetAudioSubscribeOnlyByRequest ): number { return 30004; }

  startScreenCapture(request: StartScreenCaptureRequest , result: Result<number>): void { result.success(30004); }

  stopScreenCapture(): number { return 30004; }

  enableLoopbackRecording(enable: boolean ): number { return 30004; }

  subscribeRemoteVideoStream(request: SubscribeRemoteVideoStreamRequest ): number { return 30004; }

  subscribeRemoteSubStreamVideo(request: SubscribeRemoteSubStreamVideoRequest ): number { return 30004; }

  muteLocalAudioStream(mute: boolean ): number { return 30004; }

  muteLocalVideoStream(mute: boolean , streamType: number ): number { return 30004; }

  startAudioDump(): number { return 30004; }

  startAudioDumpWithType(dumpType: number ): number { return 30004; }

  stopAudioDump(): number { return 30004; }

  enableAudioVolumeIndication(request: EnableAudioVolumeIndicationRequest ): number { return 30004; }

  adjustRecordingSignalVolume(volume: number ): number { return 30004; }

  adjustPlaybackSignalVolume(volume: number ): number { return 30004; }

  adjustLoopBackRecordingSignalVolume(volume: number ): number { return 30004; }

  addLiveStreamTask(request: AddOrUpdateLiveStreamTaskRequest ): number { return 30004; }

  updateLiveStreamTask(request: AddOrUpdateLiveStreamTaskRequest ): number { return 30004; }

  removeLiveStreamTask(request: DeleteLiveStreamTaskRequest ): number { return 30004; }

  setClientRole(role: number ): number { return 30004; }

  getConnectionState(): number { return 30004; }

  uploadSdkInfo(): number { return 30004; }

  sendSEIMsg(request: SendSEIMsgRequest ): number { return 30004; }

  setLocalVoiceReverbParam(request: SetLocalVoiceReverbParamRequest ): number { return 30004; }

  setAudioEffectPreset(preset: number ): number { return 30004; }

  setVoiceBeautifierPreset(preset: number ): number { return 30004; }

  setLocalVoicePitch(pitch: number ): number { return 30004; }

  setLocalVoiceEqualization(request: SetLocalVoiceEqualizationRequest ): number { return 30004; }

  switchChannel(request: SwitchChannelRequest ): number { return 30004; }

  startAudioRecording(request: StartAudioRecordingRequest ): number { return 30004; }

  startAudioRecordingWithConfig(request: AudioRecordingConfigurationRequest ): number { return 30004; }

  stopAudioRecording(): number { return 30004; }

  setLocalMediaPriority(request: SetLocalMediaPriorityRequest ): number { return 30004; }

  enableMediaPub(mediaType: number , enable: boolean ): number { return 30004; }

  startChannelMediaRelay(request: StartOrUpdateChannelMediaRelayRequest ): number { return 30004; }

  updateChannelMediaRelay(request: StartOrUpdateChannelMediaRelayRequest ): number { return 30004; }

  stopChannelMediaRelay(): number { return 30004; }

  adjustUserPlaybackSignalVolume(request: AdjustUserPlaybackSignalVolumeRequest ): number { return 30004; }

  setLocalPublishFallbackOption(option: number ): number { return 30004; }

  setRemoteSubscribeFallbackOption(option: number ): number { return 30004; }

  enableSuperResolution(enable: boolean ): number { return 30004; }

  enableEncryption(request: EnableEncryptionRequest ): number { return 30004; }

  setAudioSessionOperationRestriction(option: number ): number { return 30004; }

  enableVideoCorrection(enable: boolean ): number { return 30004; }

  reportCustomEvent(request: ReportCustomEventRequest ): number { return 30004; }

  getEffectDuration(effectId: number ): number { return 30004; }

  startLastmileProbeTest(request: StartLastmileProbeTestRequest ): number { return 30004; }

  stopLastmileProbeTest(): number { return 30004; }

  setVideoCorrectionConfig(request: SetVideoCorrectionConfigRequest ): number { return 30004; }

  enableVirtualBackground(request: EnableVirtualBackgroundRequest ): number { return 30004; }

  setRemoteHighPriorityAudioStream(request: SetRemoteHighPriorityAudioStreamRequest ): number { return 30004; }

  setCloudProxy(proxyType: number ): number { return 30004; }

  startBeauty(): number { return 30004; }

  stopBeauty(): void {}

  enableBeauty(enabled: boolean ): number { return 30004; }

  setBeautyEffect(level: number , beautyType: number ): number { return 30004; }

  addBeautyFilter(path: string , name: string ): number { return 30004; }

  removeBeautyFilter(): void {}

  setBeautyFilterLevel(level: number ): number { return 30004; }

  setLocalVideoWatermarkConfigs(request: SetLocalVideoWatermarkConfigsRequest ): number { return 30004; }

  setStreamAlignmentProperty(enable: boolean ): number { return 30004; }

  getNtpTimeOffset(): number { return 30004; }

  takeLocalSnapshot(streamType: number , path: string ): number { return 30004; }

  takeRemoteSnapshot(uid: number , streamType: number , path: string ): number { return 30004; }

  setExternalVideoSource(streamType: number , enable: boolean ): number { return 30004; }

  pushExternalVideoFrame(streamType: number , frame: VideoFrame ): number { return 30004; }

  setVideoDump(dumpType: number ): number { return 30004; }

  getParameter(key: string , extraInfo: string ): string { return ""; }

  setVideoStreamLayerCount(layerCount: number ): number { return 30004; }

  enableLocalData(enabled: boolean ): number { return 30004; }

  subscribeRemoteData(subscribe: boolean , userID: number ): number { return 30004; }

  getFeatureSupportedType(type: number ): number { return 30004; }

  isFeatureSupported(type: number ): boolean { return false; }

  setSubscribeAudioBlocklist(uidArray: Array<number> , streamType: number ): number { return 30004; }

  setSubscribeAudioAllowlist(uidArray: Array<number> ): number { return 30004; }

  getNetworkType(): number { return 30004; }

  startPushStreaming(request: StartPushStreamingRequest ): number { return 30004; }

  startPlayStreaming(request: StartPlayStreamingRequest ): number { return 30004; }

  stopPushStreaming(): number { return 30004; }

  stopPlayStreaming(streamId: string ): number { return 30004; }

  pausePlayStreaming(streamId: string ): number { return 30004; }

  resumePlayStreaming(streamId: string ): number { return 30004; }

  muteVideoForPlayStreaming(streamId: string , mute: boolean ): number { return 30004; }

  muteAudioForPlayStreaming(streamId: string , mute: boolean ): number { return 30004; }

  startASRCaption(request: StartASRCaptionRequest ): number { return 30004; }

  stopASRCaption(): number { return 30004; }

  setMultiPathOption(request: SetMultiPathOptionRequest ): number { return 30004; }

  aiManualInterrupt(dstUid: number ): number { return 30004; }

  AINSMode(mode: number ): number { return 30004; }

  setAudioScenario(scenario: number ): number { return 30004; }

  setExternalAudioSource(enabled: boolean , sampleRate: number , channels: number ): number { return 30004; }

  setExternalSubStreamAudioSource(enabled: boolean , sampleRate: number , channels: number ): number { return 30004; }

  setAudioRecvRange(audibleDistance: number , conversationalDistance: number , rollOffMode: number ): number { return 30004; }

  setRangeAudioMode(audioMode: number ): number { return 30004; }

  setRangeAudioTeamID(teamID: number ): number { return 30004; }

  updateSelfPosition(positionInfo: PositionInfo ): number { return 30004; }

  enableSpatializerRoomEffects(enable: boolean ): number { return 30004; }

  setSpatializerRoomProperty(property: SpatializerRoomProperty ): number { return 30004; }

  setSpatializerRenderMode(renderMode: number ): number { return 30004; }

  enableSpatializer(enable: boolean , applyToTeam: boolean ): number { return 30004; }

  setUpSpatializer(): number { return 30004; }

  addLocalRecordStreamForTask(config: LocalRecordingConfig , taskId: string ): number { return 30004; }

  removeLocalRecorderStreamForTask(taskId: string ): number { return 30004; }

  addLocalRecorderStreamLayoutForTask(config: LocalRecordingLayoutConfig , uid: number , streamType: number , streamLayer: number , taskId: number ): number { return 30004; }

  removeLocalRecorderStreamLayoutForTask(uid: number , streamType: number , streamLayer: number , taskId: string ): number { return 30004; }

  updateLocalRecorderStreamLayoutForTask(infos: Array<LocalRecordingStreamInfo> , taskId: string ): number { return 30004; }

  replaceLocalRecorderStreamLayoutForTask(infos: Array<LocalRecordingStreamInfo> , taskId: string ): number { return 30004; }

  updateLocalRecorderWaterMarksForTask(watermarks: Array<VideoWatermarkConfig> , taskId: string ): number { return 30004; }

  pushLocalRecorderVideoFrameForTask(uid: number , streamType: number , streamLayer: number , taskId: string , frame: VideoFrame ): number { return 30004; }

  showLocalRecorderStreamDefaultCoverForTask(showEnabled: boolean , uid: number , streamType: number , streamLayer: number , taskId: string ): number { return 30004; }

  stopLocalRecorderRemuxMp4(taskId: string ): number { return 30004; }

  remuxFlvToMp4(flvPath: string , mp4Path: string , saveOri: boolean ): number { return 30004; }

  stopRemuxFlvToMp4(): number { return 30004; }

  sendData(frame: DataExternalFrame ): number { return 30004; }

  pushExternalAudioFrame(frame: AudioExternalFrame ): number { return 30004; }

  pushExternalSubAudioFrame(frame: AudioExternalFrame ): number { return 30004; }
  /*
  *  请求LLM
  *
  *  方法成功调用后，房间内的成员可以接收到来自LLM的响应。
  *
  *  **调用时机**
  *
  *  请在引擎初始化之后，且在加入房间后调用。
  *
  *  **参数说明**
  *
  *  [request] - 包含 dstUid 和 params 的请求对象
  *    - dstUid: AI在会中的uid，默认可以写0，sdk会自动查找
  *    - params: LLM请求参数
  *
  *  **返回值**
  *
  *  返回 Future<NERtcLLMRequestResult>，包含回调结果
  *    - taskId: 任务ID
  *    - code: 错误码，0表示成功
  *    - errorMsg: 错误信息
  */
  requestLLM(request: RequestLLMRequest , result: Result<NERtcLLMRequestResult>): void { result.success(new NERtcLLMRequestResult("", 30004, "Not supported")); }
  /** The codec used by EngineApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `EngineApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: EngineApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.create", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.create(args[0] as CreateEngineRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.createChannel", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.createChannel(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.version", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: NERtcVersion = api!.version();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.checkPermission", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: Array<string> = api!.checkPermission();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setParameters", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setParameters(args[0] as Map<string, Object>);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.release", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<number> = new ResultImp();

              api!.release(resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setStatsEventCallback", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.setStatsEventCallback();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.clearStatsEventCallback", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.clearStatsEventCallback();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setChannelProfile", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setChannelProfile(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.joinChannel", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.joinChannel(args[0] as JoinChannelRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.leaveChannel", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.leaveChannel();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.updatePermissionKey", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updatePermissionKey(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableLocalAudio", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalAudio(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.subscribeRemoteAudio", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteAudio(args[0] as SubscribeRemoteAudioRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.subscribeAllRemoteAudio", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeAllRemoteAudio(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setAudioProfile", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioProfile(args[0] as SetAudioProfileRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableDualStreamMode", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableDualStreamMode(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setLocalVideoConfig", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalVideoConfig(args[0] as SetLocalVideoConfigRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setCameraCaptureConfig", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setCameraCaptureConfig(args[0] as SetCameraCaptureConfigRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setVideoRotationMode", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setVideoRotationMode(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startVideoPreview", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startVideoPreview(args[0] as StartorStopVideoPreviewRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopVideoPreview", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopVideoPreview(args[0] as StartorStopVideoPreviewRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableLocalVideo", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalVideo(args[0] as EnableLocalVideoRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableLocalSubStreamAudio", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalSubStreamAudio(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.subscribeRemoteSubStreamAudio", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteSubStreamAudio(args[0] as SubscribeRemoteSubStreamAudioRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.muteLocalSubStreamAudio", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.muteLocalSubStreamAudio(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setAudioSubscribeOnlyBy", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioSubscribeOnlyBy(args[0] as SetAudioSubscribeOnlyByRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startScreenCapture", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<number> = new ResultImp();

              api!.startScreenCapture(args[0] as StartScreenCaptureRequest, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopScreenCapture", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopScreenCapture();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableLoopbackRecording", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLoopbackRecording(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.subscribeRemoteVideoStream", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteVideoStream(args[0] as SubscribeRemoteVideoStreamRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.subscribeRemoteSubStreamVideo", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteSubStreamVideo(args[0] as SubscribeRemoteSubStreamVideoRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.muteLocalAudioStream", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.muteLocalAudioStream(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.muteLocalVideoStream", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.muteLocalVideoStream(args[0] as boolean, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startAudioDump", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.startAudioDump();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startAudioDumpWithType", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startAudioDumpWithType(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopAudioDump", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopAudioDump();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableAudioVolumeIndication", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableAudioVolumeIndication(args[0] as EnableAudioVolumeIndicationRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.adjustRecordingSignalVolume", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.adjustRecordingSignalVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.adjustPlaybackSignalVolume", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.adjustPlaybackSignalVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.adjustLoopBackRecordingSignalVolume", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.adjustLoopBackRecordingSignalVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.addLiveStreamTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.addLiveStreamTask(args[0] as AddOrUpdateLiveStreamTaskRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.updateLiveStreamTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateLiveStreamTask(args[0] as AddOrUpdateLiveStreamTaskRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.removeLiveStreamTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.removeLiveStreamTask(args[0] as DeleteLiveStreamTaskRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setClientRole", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setClientRole(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.getConnectionState", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getConnectionState();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.uploadSdkInfo", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.uploadSdkInfo();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.sendSEIMsg", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.sendSEIMsg(args[0] as SendSEIMsgRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setLocalVoiceReverbParam", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalVoiceReverbParam(args[0] as SetLocalVoiceReverbParamRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setAudioEffectPreset", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioEffectPreset(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setVoiceBeautifierPreset", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setVoiceBeautifierPreset(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setLocalVoicePitch", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalVoicePitch(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setLocalVoiceEqualization", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalVoiceEqualization(args[0] as SetLocalVoiceEqualizationRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.switchChannel", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.switchChannel(args[0] as SwitchChannelRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startAudioRecording", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startAudioRecording(args[0] as StartAudioRecordingRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startAudioRecordingWithConfig", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startAudioRecordingWithConfig(args[0] as AudioRecordingConfigurationRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopAudioRecording", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopAudioRecording();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setLocalMediaPriority", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalMediaPriority(args[0] as SetLocalMediaPriorityRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableMediaPub", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableMediaPub(args[0] as number, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startChannelMediaRelay", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startChannelMediaRelay(args[0] as StartOrUpdateChannelMediaRelayRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.updateChannelMediaRelay", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateChannelMediaRelay(args[0] as StartOrUpdateChannelMediaRelayRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopChannelMediaRelay", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopChannelMediaRelay();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.adjustUserPlaybackSignalVolume", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.adjustUserPlaybackSignalVolume(args[0] as AdjustUserPlaybackSignalVolumeRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setLocalPublishFallbackOption", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalPublishFallbackOption(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setRemoteSubscribeFallbackOption", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRemoteSubscribeFallbackOption(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableSuperResolution", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableSuperResolution(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableEncryption", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableEncryption(args[0] as EnableEncryptionRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setAudioSessionOperationRestriction", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioSessionOperationRestriction(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableVideoCorrection", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableVideoCorrection(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.reportCustomEvent", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.reportCustomEvent(args[0] as ReportCustomEventRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.getEffectDuration", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getEffectDuration(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startLastmileProbeTest", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startLastmileProbeTest(args[0] as StartLastmileProbeTestRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopLastmileProbeTest", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopLastmileProbeTest();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setVideoCorrectionConfig", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setVideoCorrectionConfig(args[0] as SetVideoCorrectionConfigRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableVirtualBackground", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableVirtualBackground(args[0] as EnableVirtualBackgroundRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setRemoteHighPriorityAudioStream", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRemoteHighPriorityAudioStream(args[0] as SetRemoteHighPriorityAudioStreamRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setCloudProxy", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setCloudProxy(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startBeauty", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.startBeauty();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopBeauty", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                api!.stopBeauty();
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableBeauty", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableBeauty(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setBeautyEffect", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setBeautyEffect(args[0] as number, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.addBeautyFilter", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.addBeautyFilter(args[0] as string, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.removeBeautyFilter", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                api!.removeBeautyFilter();
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setBeautyFilterLevel", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setBeautyFilterLevel(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setLocalVideoWatermarkConfigs", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setLocalVideoWatermarkConfigs(args[0] as SetLocalVideoWatermarkConfigsRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setStreamAlignmentProperty", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setStreamAlignmentProperty(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.getNtpTimeOffset", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getNtpTimeOffset();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.takeLocalSnapshot", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.takeLocalSnapshot(args[0] as number, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.takeRemoteSnapshot", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.takeRemoteSnapshot(args[0] as number, args[1] as number, args[2] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setExternalVideoSource", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setExternalVideoSource(args[0] as number, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.pushExternalVideoFrame", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.pushExternalVideoFrame(args[0] as number, args[1] as VideoFrame);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setVideoDump", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setVideoDump(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.getParameter", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: string = api!.getParameter(args[0] as string, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setVideoStreamLayerCount", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setVideoStreamLayerCount(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableLocalData", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableLocalData(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.subscribeRemoteData", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.subscribeRemoteData(args[0] as boolean, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.getFeatureSupportedType", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getFeatureSupportedType(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.isFeatureSupported", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isFeatureSupported(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setSubscribeAudioBlocklist", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSubscribeAudioBlocklist(args[0] as Array<number>, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setSubscribeAudioAllowlist", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSubscribeAudioAllowlist(args[0] as Array<number>);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.getNetworkType", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getNetworkType();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startPushStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startPushStreaming(args[0] as StartPushStreamingRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startPlayStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startPlayStreaming(args[0] as StartPlayStreamingRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopPushStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopPushStreaming();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopPlayStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopPlayStreaming(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.pausePlayStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.pausePlayStreaming(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.resumePlayStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.resumePlayStreaming(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.muteVideoForPlayStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.muteVideoForPlayStreaming(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.muteAudioForPlayStreaming", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.muteAudioForPlayStreaming(args[0] as string, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.startASRCaption", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startASRCaption(args[0] as StartASRCaptionRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopASRCaption", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopASRCaption();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setMultiPathOption", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setMultiPathOption(args[0] as SetMultiPathOptionRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.aiManualInterrupt", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.aiManualInterrupt(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.AINSMode", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.AINSMode(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setAudioScenario", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioScenario(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setExternalAudioSource", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setExternalAudioSource(args[0] as boolean, args[1] as number, args[2] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setExternalSubStreamAudioSource", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setExternalSubStreamAudioSource(args[0] as boolean, args[1] as number, args[2] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setAudioRecvRange", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioRecvRange(args[0] as number, args[1] as number, args[2] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setRangeAudioMode", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRangeAudioMode(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setRangeAudioTeamID", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRangeAudioTeamID(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.updateSelfPosition", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateSelfPosition(args[0] as PositionInfo);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableSpatializerRoomEffects", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableSpatializerRoomEffects(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setSpatializerRoomProperty", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSpatializerRoomProperty(args[0] as SpatializerRoomProperty);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setSpatializerRenderMode", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSpatializerRenderMode(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.enableSpatializer", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableSpatializer(args[0] as boolean, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.setUpSpatializer", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.setUpSpatializer();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.addLocalRecordStreamForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.addLocalRecordStreamForTask(args[0] as LocalRecordingConfig, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.removeLocalRecorderStreamForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.removeLocalRecorderStreamForTask(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.addLocalRecorderStreamLayoutForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.addLocalRecorderStreamLayoutForTask(args[0] as LocalRecordingLayoutConfig, args[1] as number, args[2] as number, args[3] as number, args[4] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.removeLocalRecorderStreamLayoutForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.removeLocalRecorderStreamLayoutForTask(args[0] as number, args[1] as number, args[2] as number, args[3] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.updateLocalRecorderStreamLayoutForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateLocalRecorderStreamLayoutForTask(args[0] as Array<LocalRecordingStreamInfo>, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.replaceLocalRecorderStreamLayoutForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.replaceLocalRecorderStreamLayoutForTask(args[0] as Array<LocalRecordingStreamInfo>, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.updateLocalRecorderWaterMarksForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.updateLocalRecorderWaterMarksForTask(args[0] as Array<VideoWatermarkConfig>, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.pushLocalRecorderVideoFrameForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.pushLocalRecorderVideoFrameForTask(args[0] as number, args[1] as number, args[2] as number, args[3] as string, args[4] as VideoFrame);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.showLocalRecorderStreamDefaultCoverForTask", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.showLocalRecorderStreamDefaultCoverForTask(args[0] as boolean, args[1] as number, args[2] as number, args[3] as number, args[4] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopLocalRecorderRemuxMp4", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopLocalRecorderRemuxMp4(args[0] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.remuxFlvToMp4", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.remuxFlvToMp4(args[0] as string, args[1] as string, args[2] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.stopRemuxFlvToMp4", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopRemuxFlvToMp4();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.sendData", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.sendData(args[0] as DataExternalFrame);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.pushExternalAudioFrame", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.pushExternalAudioFrame(args[0] as AudioExternalFrame);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.pushExternalSubAudioFrame", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.pushExternalSubAudioFrame(args[0] as AudioExternalFrame);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.EngineApi.requestLLM", EngineApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<NERtcLLMRequestResult>{
                    success(result: NERtcLLMRequestResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<NERtcLLMRequestResult> = new ResultImp();

              api!.requestLLM(args[0] as RequestLLMRequest, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class VideoRendererApi {

  createVideoRenderer(): number { return 30004; }

  setMirror(textureId: number , mirror: boolean ): number { return 30004; }

  setupLocalVideoRenderer(textureId: number , channelTag: string ): number { return 30004; }

  setupRemoteVideoRenderer(uid: number , textureId: number , channelTag: string ): number { return 30004; }

  setupLocalSubStreamVideoRenderer(textureId: number , channelTag: string ): number { return 30004; }

  setupRemoteSubStreamVideoRenderer(uid: number , textureId: number , channelTag: string ): number { return 30004; }

  setupPlayStreamingCanvas(streamId: string , textureId: number ): number { return 30004; }

  disposeVideoRenderer(textureId: number ): void {}
  /** The codec used by VideoRendererApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `VideoRendererApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: VideoRendererApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.createVideoRenderer", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.createVideoRenderer();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.setMirror", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setMirror(args[0] as number, args[1] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.setupLocalVideoRenderer", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setupLocalVideoRenderer(args[0] as number, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.setupRemoteVideoRenderer", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setupRemoteVideoRenderer(args[0] as number, args[1] as number, args[2] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.setupLocalSubStreamVideoRenderer", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setupLocalSubStreamVideoRenderer(args[0] as number, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.setupRemoteSubStreamVideoRenderer", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setupRemoteSubStreamVideoRenderer(args[0] as number, args[1] as number, args[2] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.setupPlayStreamingCanvas", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setupPlayStreamingCanvas(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.VideoRendererApi.disposeVideoRenderer", VideoRendererApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.disposeVideoRenderer(args[0] as number);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated class from Pigeon that represents Flutter messages that can be called from ArkTS.*/
export class NERtcDeviceEventSink {
  binaryMessenger: BinaryMessenger;

  constructor(binaryMessenger: BinaryMessenger) {
    this.binaryMessenger = binaryMessenger;
  }

  /** The codec used by NERtcDeviceEventSink. */
  static getCodec(): MessageCodec<Object> {
    return PigeonCodec.INSTANCE;
  }

  onAudioDeviceChanged(selectedArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcDeviceEventSink.onAudioDeviceChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcDeviceEventSink.getCodec());
    channel.send(
        [selectedArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioDeviceStateChange(deviceTypeArg: number,deviceStateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcDeviceEventSink.onAudioDeviceStateChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcDeviceEventSink.getCodec());
    channel.send(
        [deviceTypeArg, deviceStateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onVideoDeviceStateChange(deviceTypeArg: number,deviceStateArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcDeviceEventSink.onVideoDeviceStateChange';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcDeviceEventSink.getCodec());
    channel.send(
        [deviceTypeArg, deviceStateArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onCameraFocusChanged(focusPointArg: CGPoint, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcDeviceEventSink.onCameraFocusChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcDeviceEventSink.getCodec());
    channel.send(
        [focusPointArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onCameraExposureChanged(exposurePointArg: CGPoint, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcDeviceEventSink.onCameraExposureChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcDeviceEventSink.getCodec());
    channel.send(
        [exposurePointArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class DeviceManagerApi {

  isSpeakerphoneOn(): boolean { return false; }

  isCameraZoomSupported(): boolean { return false; }

  isCameraTorchSupported(): boolean { return false; }

  isCameraFocusSupported(): boolean { return false; }

  isCameraExposurePositionSupported(): boolean { return false; }

  setSpeakerphoneOn(enable: boolean ): number { return 30004; }

  switchCamera(): number { return 30004; }

  setCameraZoomFactor(factor: number ): number { return 30004; }

  getCameraMaxZoom(): number { return 30004; }

  setCameraTorchOn(on: boolean ): number { return 30004; }

  setCameraFocusPosition(request: SetCameraPositionRequest ): number { return 30004; }

  setCameraExposurePosition(request: SetCameraPositionRequest ): number { return 30004; }

  setPlayoutDeviceMute(mute: boolean ): number { return 30004; }

  isPlayoutDeviceMute(): boolean { return false; }

  setRecordDeviceMute(mute: boolean ): number { return 30004; }

  isRecordDeviceMute(): boolean { return false; }

  enableEarback(enabled: boolean , volume: number ): number { return 30004; }

  setEarbackVolume(volume: number ): number { return 30004; }

  setAudioFocusMode(focusMode: number ): number { return 30004; }

  getCurrentCamera(): number { return 30004; }

  switchCameraWithPosition(position: number ): number { return 30004; }

  getCameraCurrentZoom(): number { return 30004; }
  /** The codec used by DeviceManagerApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `DeviceManagerApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: DeviceManagerApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.isSpeakerphoneOn", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isSpeakerphoneOn();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.isCameraZoomSupported", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isCameraZoomSupported();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.isCameraTorchSupported", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isCameraTorchSupported();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.isCameraFocusSupported", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isCameraFocusSupported();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.isCameraExposurePositionSupported", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isCameraExposurePositionSupported();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setSpeakerphoneOn", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setSpeakerphoneOn(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.switchCamera", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.switchCamera();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setCameraZoomFactor", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setCameraZoomFactor(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.getCameraMaxZoom", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getCameraMaxZoom();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setCameraTorchOn", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setCameraTorchOn(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setCameraFocusPosition", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setCameraFocusPosition(args[0] as SetCameraPositionRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setCameraExposurePosition", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setCameraExposurePosition(args[0] as SetCameraPositionRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setPlayoutDeviceMute", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setPlayoutDeviceMute(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.isPlayoutDeviceMute", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isPlayoutDeviceMute();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setRecordDeviceMute", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setRecordDeviceMute(args[0] as boolean);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.isRecordDeviceMute", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.isRecordDeviceMute();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.enableEarback", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.enableEarback(args[0] as boolean, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setEarbackVolume", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setEarbackVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.setAudioFocusMode", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioFocusMode(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.getCurrentCamera", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getCurrentCamera();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.switchCameraWithPosition", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.switchCameraWithPosition(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.DeviceManagerApi.getCameraCurrentZoom", DeviceManagerApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getCameraCurrentZoom();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class AudioMixingApi {

  startAudioMixing(request: StartAudioMixingRequest ): number { return 30004; }

  stopAudioMixing(): number { return 30004; }

  pauseAudioMixing(): number { return 30004; }

  resumeAudioMixing(): number { return 30004; }

  setAudioMixingSendVolume(volume: number ): number { return 30004; }

  getAudioMixingSendVolume(): number { return 30004; }

  setAudioMixingPlaybackVolume(volume: number ): number { return 30004; }

  getAudioMixingPlaybackVolume(): number { return 30004; }

  getAudioMixingDuration(): number { return 30004; }

  getAudioMixingCurrentPosition(): number { return 30004; }

  setAudioMixingPosition(position: number ): number { return 30004; }

  setAudioMixingPitch(pitch: number ): number { return 30004; }

  getAudioMixingPitch(): number { return 30004; }
  /** The codec used by AudioMixingApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `AudioMixingApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: AudioMixingApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.startAudioMixing", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.startAudioMixing(args[0] as StartAudioMixingRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.stopAudioMixing", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopAudioMixing();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.pauseAudioMixing", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.pauseAudioMixing();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.resumeAudioMixing", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.resumeAudioMixing();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.setAudioMixingSendVolume", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioMixingSendVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.getAudioMixingSendVolume", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getAudioMixingSendVolume();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.setAudioMixingPlaybackVolume", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioMixingPlaybackVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.getAudioMixingPlaybackVolume", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getAudioMixingPlaybackVolume();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.getAudioMixingDuration", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getAudioMixingDuration();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.getAudioMixingCurrentPosition", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getAudioMixingCurrentPosition();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.setAudioMixingPosition", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioMixingPosition(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.setAudioMixingPitch", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setAudioMixingPitch(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioMixingApi.getAudioMixingPitch", AudioMixingApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.getAudioMixingPitch();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated class from Pigeon that represents Flutter messages that can be called from ArkTS.*/
export class NERtcAudioMixingEventSink {
  binaryMessenger: BinaryMessenger;

  constructor(binaryMessenger: BinaryMessenger) {
    this.binaryMessenger = binaryMessenger;
  }

  /** The codec used by NERtcAudioMixingEventSink. */
  static getCodec(): MessageCodec<Object> {
    return PigeonCodec.INSTANCE;
  }

  onAudioMixingStateChanged(reasonArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcAudioMixingEventSink.onAudioMixingStateChanged';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcAudioMixingEventSink.getCodec());
    channel.send(
        [reasonArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioMixingTimestampUpdate(timestampMsArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcAudioMixingEventSink.onAudioMixingTimestampUpdate';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcAudioMixingEventSink.getCodec());
    channel.send(
        [timestampMsArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class AudioEffectApi {

  playEffect(request: PlayEffectRequest ): number { return 30004; }

  stopEffect(effectId: number ): number { return 30004; }

  stopAllEffects(): number { return 30004; }

  pauseEffect(effectId: number ): number { return 30004; }

  resumeEffect(effectId: number ): number { return 30004; }

  pauseAllEffects(): number { return 30004; }

  resumeAllEffects(): number { return 30004; }

  setEffectSendVolume(effectId: number , volume: number ): number { return 30004; }

  getEffectSendVolume(effectId: number ): number { return 30004; }

  setEffectPlaybackVolume(effectId: number , volume: number ): number { return 30004; }

  getEffectPlaybackVolume(effectId: number ): number { return 30004; }

  getEffectDuration(effectId: number ): number { return 30004; }

  getEffectCurrentPosition(effectId: number ): number { return 30004; }

  setEffectPitch(effectId: number , pitch: number ): number { return 30004; }

  getEffectPitch(effectId: number ): number { return 30004; }

  setEffectPosition(effectId: number , position: number ): number { return 30004; }
  /** The codec used by AudioEffectApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `AudioEffectApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: AudioEffectApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.playEffect", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.playEffect(args[0] as PlayEffectRequest);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.stopEffect", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopEffect(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.stopAllEffects", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.stopAllEffects();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.pauseEffect", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.pauseEffect(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.resumeEffect", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.resumeEffect(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.pauseAllEffects", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.pauseAllEffects();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.resumeAllEffects", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: number = api!.resumeAllEffects();
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.setEffectSendVolume", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setEffectSendVolume(args[0] as number, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.getEffectSendVolume", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getEffectSendVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.setEffectPlaybackVolume", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setEffectPlaybackVolume(args[0] as number, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.getEffectPlaybackVolume", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getEffectPlaybackVolume(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.getEffectDuration", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getEffectDuration(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.getEffectCurrentPosition", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getEffectCurrentPosition(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.setEffectPitch", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setEffectPitch(args[0] as number, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.getEffectPitch", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.getEffectPitch(args[0] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.nertc_core_platform_interface.AudioEffectApi.setEffectPosition", AudioEffectApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: number = api!.setEffectPosition(args[0] as number, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated class from Pigeon that represents Flutter messages that can be called from ArkTS.*/
export class NERtcAudioEffectEventSink {
  binaryMessenger: BinaryMessenger;

  constructor(binaryMessenger: BinaryMessenger) {
    this.binaryMessenger = binaryMessenger;
  }

  /** The codec used by NERtcAudioEffectEventSink. */
  static getCodec(): MessageCodec<Object> {
    return PigeonCodec.INSTANCE;
  }

  onAudioEffectFinished(effectIdArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcAudioEffectEventSink.onAudioEffectFinished';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcAudioEffectEventSink.getCodec());
    channel.send(
        [effectIdArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAudioEffectTimestampUpdate(idArg: number,timestampMsArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcAudioEffectEventSink.onAudioEffectTimestampUpdate';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcAudioEffectEventSink.getCodec());
    channel.send(
        [idArg, timestampMsArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
}
/* Generated class from Pigeon that represents Flutter messages that can be called from ArkTS.*/
export class NERtcStatsEventSink {
  binaryMessenger: BinaryMessenger;

  constructor(binaryMessenger: BinaryMessenger) {
    this.binaryMessenger = binaryMessenger;
  }

  /** The codec used by NERtcStatsEventSink. */
  static getCodec(): MessageCodec<Object> {
    return PigeonCodec.INSTANCE;
  }

  onRtcStats(argumentsArg: Map<Object, Object>,channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcStatsEventSink.onRtcStats';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcStatsEventSink.getCodec());
    channel.send(
        [argumentsArg, channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalAudioStats(argumentsArg: Map<Object, Object>,channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcStatsEventSink.onLocalAudioStats';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcStatsEventSink.getCodec());
    channel.send(
        [argumentsArg, channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteAudioStats(argumentsArg: Map<Object, Object>,channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcStatsEventSink.onRemoteAudioStats';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcStatsEventSink.getCodec());
    channel.send(
        [argumentsArg, channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onLocalVideoStats(argumentsArg: Map<Object, Object>,channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcStatsEventSink.onLocalVideoStats';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcStatsEventSink.getCodec());
    channel.send(
        [argumentsArg, channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onRemoteVideoStats(argumentsArg: Map<Object, Object>,channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcStatsEventSink.onRemoteVideoStats';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcStatsEventSink.getCodec());
    channel.send(
        [argumentsArg, channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onNetworkQuality(argumentsArg: Map<Object, Object>,channelTagArg: string, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcStatsEventSink.onNetworkQuality';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcStatsEventSink.getCodec());
    channel.send(
        [argumentsArg, channelTagArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
}
/* Generated class from Pigeon that represents Flutter messages that can be called from ArkTS.*/
export class NERtcLiveStreamEventSink {
  binaryMessenger: BinaryMessenger;

  constructor(binaryMessenger: BinaryMessenger) {
    this.binaryMessenger = binaryMessenger;
  }

  /** The codec used by NERtcLiveStreamEventSink. */
  static getCodec(): MessageCodec<Object> {
    return PigeonCodec.INSTANCE;
  }

  onUpdateLiveStreamTask(taskIdArg: string,errCodeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcLiveStreamEventSink.onUpdateLiveStreamTask';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcLiveStreamEventSink.getCodec());
    channel.send(
        [taskIdArg, errCodeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onAddLiveStreamTask(taskIdArg: string,errCodeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcLiveStreamEventSink.onAddLiveStreamTask';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcLiveStreamEventSink.getCodec());
    channel.send(
        [taskIdArg, errCodeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
  onDeleteLiveStreamTask(taskIdArg: string,errCodeArg: number, callback: Reply<void>) {
    const channelName: string = 'dev.flutter.pigeon.nertc_core_platform_interface.NERtcLiveStreamEventSink.onDeleteLiveStreamTask';
    let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel<Object>(
            this.binaryMessenger, channelName, NERtcLiveStreamEventSink.getCodec());
    channel.send(
        [taskIdArg, errCodeArg],
        channelReply => {
          if (Array.isArray(channelReply)) {
            let listReply: Object[] = channelReply as Object[] ;
            if (listReply.length > 1) {
              callback.reply();
            } else {
              callback.reply();
            }
          }  else {
            callback.reply();
          }
        });
  }
}
