import { Any } from '@ohos/flutter_ohos';
import { BinaryMessenger } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';
import { Reply } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BasicMessageChannel';
import {
  NERtcCallbackEx,
  NERtcChannel,
  NERtcChannelCallback,
  NERtcConstants,
  NERtcSDK,
} from '@nertc/nertc_sdk';
import * as Pigeon from './Messages';

const ERROR_NOT_SUPPORTED = 30004;

class VoidReply implements Reply<void> {
  reply(_reply: void): void {}
}

const VOID_REPLY = new VoidReply();

function uid(value: number): bigint {
  return BigInt(value);
}

function asBool(value: boolean | number): boolean {
  return value === true || value === 1;
}

class EngineCallback extends NERtcCallbackEx {
  private readonly engine: Pigeon.NERtcChannelEventSink;
  private readonly device: Pigeon.NERtcDeviceEventSink;
  private readonly mixing: Pigeon.NERtcAudioMixingEventSink;
  private readonly effect: Pigeon.NERtcAudioEffectEventSink;

  constructor(
    engine: Pigeon.NERtcChannelEventSink,
    device: Pigeon.NERtcDeviceEventSink,
    mixing: Pigeon.NERtcAudioMixingEventSink,
    effect: Pigeon.NERtcAudioEffectEventSink,
  ) {
    super();
    this.engine = engine;
    this.device = device;
    this.mixing = mixing;
    this.effect = effect;
  }

  onJoinChannel(result: number, channelId: bigint, elapsed: bigint, userId: bigint): void {
    this.engine.onJoinChannel(result, Number(channelId), Number(elapsed), Number(userId), VOID_REPLY);
  }

  onLeaveChannel(result: number): void {
    this.engine.onLeaveChannel(result, VOID_REPLY);
  }

  onUserJoined(userId: bigint, extraInfo?: NERtcConstants.NERtcUserJoinExtraInfo): void {
    const extra = new Pigeon.NERtcUserJoinExtraInfo(extraInfo?.customInfo ?? '');
    this.engine.onUserJoined(new Pigeon.UserJoinedEvent(Number(userId), extra), VOID_REPLY);
  }

  onUserLeave(userId: bigint, reason: number, extraInfo?: NERtcConstants.NERtcUserLeaveExtraInfo): void {
    const extra = new Pigeon.NERtcUserLeaveExtraInfo(extraInfo?.customInfo ?? '');
    this.engine.onUserLeave(new Pigeon.UserLeaveEvent(Number(userId), reason, extra), VOID_REPLY);
  }

  onUserAudioStart(userId: bigint): void {
    this.engine.onUserAudioStart(Number(userId), VOID_REPLY);
  }

  onUserAudioStop(userId: bigint): void {
    this.engine.onUserAudioStop(Number(userId), VOID_REPLY);
  }

  onUserAudioMute(userId: bigint, muted: boolean): void {
    this.engine.onUserAudioMute(Number(userId), asBool(muted), VOID_REPLY);
  }

  onUserVideoStart(userId: bigint, maxProfile: NERtcConstants.NERtcVideoProfileType,
    _streamType?: NERtcConstants.NERtcVideoStreamType): void {
    this.engine.onUserVideoStart(Number(userId), maxProfile, VOID_REPLY);
  }

  onUserVideoStop(userId: bigint, _streamType?: NERtcConstants.NERtcVideoStreamType): void {
    this.engine.onUserVideoStop(Number(userId), VOID_REPLY);
  }

  onUserVideoMute(userId: bigint, muted: boolean,
    streamType?: NERtcConstants.NERtcVideoStreamType): void {
    const event = new Pigeon.UserVideoMuteEvent(Number(userId), asBool(muted), streamType ?? 0);
    this.engine.onUserVideoMute(event, VOID_REPLY);
  }

  onDisconnect(reason: number): void {
    this.engine.onDisconnect(reason, VOID_REPLY);
  }

  onReconnectingStart(): void {
    this.engine.onReconnectingStart(VOID_REPLY);
  }

  onReJoinChannel(result: number, channelId: bigint): void {
    this.engine.onReJoinChannel(result, Number(channelId), VOID_REPLY);
  }

  onConnectionStateChanged(state: number, reason: number): void {
    this.engine.onConnectionStateChanged(state, reason, VOID_REPLY);
  }

  onClientRoleChange(oldRole: number, newRole: number): void {
    this.engine.onClientRoleChange(oldRole, newRole, VOID_REPLY);
  }

  onError(code: number): void {
    this.engine.onError(code, VOID_REPLY);
  }

  onWarning(code: number): void {
    this.engine.onWarning(code, VOID_REPLY);
  }

  onRecvSEIMsg(_userId: bigint, _data: Uint8Array, _dataSize: number): void {}

  onLocalAudioVolumeIndication(volume: number, vadFlag: boolean): void {
    this.engine.onLocalAudioVolumeIndication(volume, asBool(vadFlag), VOID_REPLY);
  }

  onAudioDeviceChanged(selected: number): void {
    this.device.onAudioDeviceChanged(selected, VOID_REPLY);
  }

  onAudioDeviceStateChanged(deviceType: NERtcConstants.AudioDeviceType,
    deviceState: NERtcConstants.AudioDeviceState): void {
    this.device.onAudioDeviceStateChange(deviceType, deviceState, VOID_REPLY);
  }

  onAudioMixingStateChanged(reason: number): void {
    this.mixing.onAudioMixingStateChanged(reason, VOID_REPLY);
  }

  onAudioMixingTimestampUpdate(timestampMs: bigint): void {
    this.mixing.onAudioMixingTimestampUpdate(Number(timestampMs), VOID_REPLY);
  }

  onAudioEffectFinished(effectId: number): void {
    this.effect.onAudioEffectFinished(effectId, VOID_REPLY);
  }

  onAudioEffectTimestampUpdate(effectId: number, timestampMs: bigint): void {
    this.effect.onAudioEffectTimestampUpdate(effectId, Number(timestampMs), VOID_REPLY);
  }
}

class SubChannelCallback extends NERtcChannelCallback {
  private readonly channelTag: string;
  private readonly events: Pigeon.NERtcSubChannelEventSink;

  constructor(
    channelTag: string,
    events: Pigeon.NERtcSubChannelEventSink,
  ) {
    super();
    this.channelTag = channelTag;
    this.events = events;
  }

  onJoinChannel(result: number, channelId: bigint, elapsed: bigint, userId: bigint): void {
    this.events.onJoinChannel(this.channelTag, result, Number(channelId), Number(elapsed), Number(userId), VOID_REPLY);
  }

  onLeaveChannel(result: number): void {
    this.events.onLeaveChannel(this.channelTag, result, VOID_REPLY);
  }

  onUserJoined(userId: bigint, extraInfo?: NERtcConstants.NERtcUserJoinExtraInfo): void {
    const extra = new Pigeon.NERtcUserJoinExtraInfo(extraInfo?.customInfo ?? '');
    this.events.onUserJoined(this.channelTag, new Pigeon.UserJoinedEvent(Number(userId), extra), VOID_REPLY);
  }

  onUserLeave(userId: bigint, reason: number, extraInfo?: NERtcConstants.NERtcUserLeaveExtraInfo): void {
    const extra = new Pigeon.NERtcUserLeaveExtraInfo(extraInfo?.customInfo ?? '');
    this.events.onUserLeave(
      this.channelTag,
      new Pigeon.UserLeaveEvent(Number(userId), reason, extra),
      VOID_REPLY,
    );
  }

  onUserAudioStart(userId: bigint): void {
    this.events.onUserAudioStart(this.channelTag, Number(userId), VOID_REPLY);
  }

  onUserAudioStop(userId: bigint): void {
    this.events.onUserAudioStop(this.channelTag, Number(userId), VOID_REPLY);
  }

  onUserAudioMute(userId: bigint, muted: boolean): void {
    this.events.onUserAudioMute(this.channelTag, Number(userId), asBool(muted), VOID_REPLY);
  }

  onUserVideoStart(userId: bigint, maxProfile: number,
    _streamType?: NERtcConstants.NERtcVideoStreamType): void {
    this.events.onUserVideoStart(this.channelTag, Number(userId), maxProfile, VOID_REPLY);
  }

  onUserVideoStop(userId: bigint, _streamType?: NERtcConstants.NERtcVideoStreamType): void {
    this.events.onUserVideoStop(this.channelTag, Number(userId), VOID_REPLY);
  }

  onUserVideoMute(userId: bigint, muted: boolean,
    streamType?: NERtcConstants.NERtcVideoStreamType): void {
    const event = new Pigeon.UserVideoMuteEvent(Number(userId), asBool(muted), streamType ?? 0);
    this.events.onUserVideoMute(this.channelTag, event, VOID_REPLY);
  }

  onDisconnect(reason: number): void {
    this.events.onDisconnect(this.channelTag, reason, VOID_REPLY);
  }

  onError(code: number): void {
    this.events.onError(this.channelTag, code, VOID_REPLY);
  }

  onWarning(code: number): void {
    this.events.onWarning(this.channelTag, code, VOID_REPLY);
  }
}

class OhosEngineApi extends Pigeon.EngineApi {
  private readonly callback: EngineCallback;
  private readonly channelApi: OhosChannelApi;

  constructor(callback: EngineCallback, channelApi: OhosChannelApi) {
    super();
    this.callback = callback;
    this.channelApi = channelApi;
  }

  private engine() {
    return NERtcSDK.getInstance();
  }

  create(request: Pigeon.CreateEngineRequest): number {
    const options: NERtcConstants.NERtcOption = {
      logLevel: request.getLogLevel() ?? 0,
      logDir: request.getLogDir(),
    };
    const addresses = request.getServerAddresses();
    if (addresses?.getValid() == true) {
      options.serverAddress = {
        lbsServer: '',
        channelServer: addresses.getChannelServer() ?? '',
        statisticsServer: addresses.getStatisticsServer() ?? '',
        roomServer: addresses.getRoomServer() ?? '',
        compatServer: addresses.getCompatServer() ?? '',
        nosLbsServer: addresses.getNosLbsServer() ?? '',
        nosUploadSever: addresses.getNosUploadSever() ?? '',
        nosTokenServer: addresses.getNosTokenServer() ?? '',
        sdkConfigServer: addresses.getSdkConfigServer() ?? '',
        cloudProxyServer: addresses.getCloudProxyServer() ?? '',
        webSocketProxyServer: addresses.getWebSocketProxyServer() ?? '',
        quicProxyServer: addresses.getQuicProxyServer() ?? '',
        mediaProxyServer: addresses.getMediaProxyServer() ?? '',
        statisticsDispatchServer: addresses.getStatisticsDispatchServer() ?? '',
        statisticsBackupServer: addresses.getStatisticsBackupServer() ?? '',
        useIPv6: addresses.getUseIPv6() ?? false,
      };
    }
    // HarmonyOS exposes auto-subscribe through setParameters rather than NERtcOption.
    // Set these before init, matching the Android SDK initialization sequence.
    const parameters: Record<string, Object> = {};
    if (request.getAudioAutoSubscribe() !== undefined) {
      parameters[NERtcConstants.NERtcParameterKey.kNERtcKeyAutoSubscribeAudio] =
        request.getAudioAutoSubscribe() as Object;
    }
    if (request.getVideoAutoSubscribe() !== undefined) {
      parameters[NERtcConstants.NERtcParameterKey.kNERtcKeyAutoSubscribeVideo] =
        request.getVideoAutoSubscribe() as Object;
    }
    if (Object.keys(parameters).length > 0) {
      this.engine().setParameters(parameters);
    }
    this.engine().init(getContext(), request.getAppKey() ?? '', this.callback, options);
    return 0;
  }

  createChannel(channelTag: string): number {
    return this.channelApi.create(channelTag);
  }

  version(): Pigeon.NERtcVersion {
    const value = NERtcSDK.version();
    return new Pigeon.NERtcVersion(
      value.version ?? '', 0, value.debug ? 'debug' : 'release', value.buildTime ?? '',
      value.buildCommit ?? '', '', '', '', '',
    );
  }

  checkPermission(): Array<string> {
    return this.engine().checkPermission() ?? [];
  }

  setParameters(params: Map<string, Object>): number {
    return this.engine().setParameters(params);
  }

  release(result: Pigeon.Result<number>): void {
    this.engine().release();
    result.success(0);
  }

  setStatsEventCallback(): number { return 0; }
  clearStatsEventCallback(): number { return 0; }
  setChannelProfile(profile: number): number { return this.engine().setChannelProfile(profile); }

  joinChannel(request: Pigeon.JoinChannelRequest): number {
    return this.engine().joinChannel(
      request.getToken() ?? '', request.getChannelName() ?? '', uid(request.getUid() ?? 0),
      request.getChannelOptions() as Any as NERtcConstants.NERtcJoinChannelOptions,
    );
  }

  leaveChannel(): number { return this.engine().leaveChannel(); }
  updatePermissionKey(_key: string): number { return ERROR_NOT_SUPPORTED; }
  enableLocalAudio(enable: boolean): number { return this.engine().enableLocalAudio(enable); }

  subscribeRemoteAudio(request: Pigeon.SubscribeRemoteAudioRequest): number {
    return this.engine().subscribeRemoteAudioStream(uid(request.getUid() ?? 0), request.getSubscribe() ?? false);
  }

  subscribeAllRemoteAudio(subscribe: boolean): number {
    return this.engine().subscribeAllRemoteAudioStreams(subscribe);
  }

  setAudioProfile(request: Pigeon.SetAudioProfileRequest): number {
    return this.engine().setAudioProfile(request.getProfile() ?? 0, request.getScenario() ?? 0);
  }

  enableDualStreamMode(enable: boolean): number { return this.engine().enableDualStreamMode(enable); }

  setLocalVideoConfig(request: Pigeon.SetLocalVideoConfigRequest): number {
    return this.engine().setLocalVideoConfig(
      request as Any as NERtcConstants.NERtcVideoEncodeConfiguration, request.getStreamType() ?? 0);
  }

  setCameraCaptureConfig(request: Pigeon.SetCameraCaptureConfigRequest): number {
    return this.engine().setCameraCaptureConfig(
      request as Any as NERtcConstants.NERtcCameraCaptureConfiguration, request.getStreamType() ?? 0);
  }

  startVideoPreview(request: Pigeon.StartorStopVideoPreviewRequest): number {
    return this.engine().startVideoPreview(request.getStreamType() ?? 0);
  }

  stopVideoPreview(request: Pigeon.StartorStopVideoPreviewRequest): number {
    return this.engine().stopVideoPreview(request.getStreamType() ?? 0);
  }

  enableLocalVideo(request: Pigeon.EnableLocalVideoRequest): number {
    return this.engine().enableLocalVideo(request.getEnable() ?? false, request.getStreamType() ?? 0);
  }

  enableLocalSubStreamAudio(enable: boolean): number { return this.engine().enableLocalSubStreamAudio(enable); }

  subscribeRemoteSubStreamAudio(request: Pigeon.SubscribeRemoteSubStreamAudioRequest): number {
    return this.engine().subscribeRemoteSubStreamAudio(uid(request.getUid() ?? 0), request.getSubscribe() ?? false);
  }

  muteLocalSubStreamAudio(muted: boolean): number { return this.engine().muteLocalSubStreamAudio(muted); }

  startScreenCapture(request: Pigeon.StartScreenCaptureRequest, result: Pigeon.Result<number>): void {
    result.success(this.engine().startScreenCapture(
      request as Any as NERtcConstants.NERtcScreenConfiguration));
  }

  stopScreenCapture(): number { return this.engine().stopScreenCapture(); }
  enableLoopbackRecording(enable: boolean): number { return this.engine().enableLoopBackRecording(enable); }

  subscribeRemoteVideoStream(request: Pigeon.SubscribeRemoteVideoStreamRequest): number {
    return this.engine().subscribeRemoteVideo(
      uid(request.getUid() ?? 0), request.getSubscribe() ?? false, 0, request.getStreamType() ?? 0);
  }

  subscribeRemoteSubStreamVideo(request: Pigeon.SubscribeRemoteSubStreamVideoRequest): number {
    return this.engine().subscribeRemoteSubStreamVideo(uid(request.getUid() ?? 0), request.getSubscribe() ?? false);
  }

  muteLocalAudioStream(mute: boolean): number { return this.engine().muteLocalAudioStream(mute); }
  muteLocalVideoStream(mute: boolean, streamType: number): number {
    return this.engine().muteLocalVideo(streamType, mute);
  }

  startAudioDump(): number { return this.engine().startAudioDump(); }
  startAudioDumpWithType(dumpType: number): number { return this.engine().startAudioDumpWithType(dumpType); }
  stopAudioDump(): number { return this.engine().stopAudioDump(); }

  enableAudioVolumeIndication(request: Pigeon.EnableAudioVolumeIndicationRequest): number {
    return this.engine().enableAudioVolumeIndication(
      request.getEnable() ?? false, BigInt(request.getInterval() ?? 0), request.getVad() ?? false);
  }

  adjustRecordingSignalVolume(volume: number): number {
    return this.engine().adjustRecordingSignalVolume(volume);
  }

  adjustPlaybackSignalVolume(volume: number): number {
    return this.engine().adjustPlaybackSignalVolume(volume);
  }

  setClientRole(role: number): number { return this.engine().setClientRole(role); }
  getConnectionState(): number { return this.engine().getConnectionState(); }
  setAudioEffectPreset(preset: number): number { return this.engine().setAudioEffectPreset(preset); }
  setVoiceBeautifierPreset(preset: number): number { return this.engine().setVoiceBeautifierPreset(preset); }
  setLocalVoicePitch(pitch: number): number { return this.engine().setLocalVoicePitch(pitch); }

  setLocalVoiceEqualization(request: Pigeon.SetLocalVoiceEqualizationRequest): number {
    return this.engine().setLocalVoiceEqualization(
      request.getBandFrequency() ?? 0, request.getBandGain() ?? 0);
  }

  enableMediaPub(mediaType: number, enable: boolean): number {
    return this.engine().enableMediaPub(mediaType, enable);
  }

  setCloudProxy(proxyType: number): number { return this.engine().setCloudProxy(proxyType); }
  getNtpTimeOffset(): number { return Number(this.engine().getNtpTimeOffset()); }
  setVideoStreamLayerCount(layerCount: number): number {
    return this.engine().setVideoStreamLayerCount(layerCount);
  }
  getFeatureSupportedType(type: number): number { return this.engine().getFeatureSupportedType(type); }
  isFeatureSupported(_type: number): boolean { return false; }
  getParameter(key: string, extraInfo: string): string { return this.engine().getParameter(key, extraInfo); }
  startASRCaption(request: Pigeon.StartASRCaptionRequest): number {
    return this.engine().startASRCaption(request as Any as NERtcConstants.NERtcASRCaptionConfig);
  }
  stopASRCaption(): number { return this.engine().stopASRCaption(); }
}

class OhosChannelApi extends Pigeon.ChannelApi {
  private readonly channels: Map<string, NERtcChannel> = new Map();
  private readonly events: Pigeon.NERtcSubChannelEventSink;

  constructor(events: Pigeon.NERtcSubChannelEventSink) {
    super();
    this.events = events;
  }

  create(channelTag: string): number {
    if (this.channels.has(channelTag)) return 0;
    const channel = NERtcSDK.getInstance().createChannel(channelTag);
    channel.setChannelCallback(new SubChannelCallback(channelTag, this.events));
    this.channels.set(channelTag, channel);
    return 0;
  }

  clear(): void {
    this.channels.forEach(channel => channel.release());
    this.channels.clear();
  }

  private channel(channelTag: string): NERtcChannel | null {
    return this.channels.get(channelTag) ?? null;
  }

  getChannelName(channelTag: string): string { return channelTag; }
  setStatsEventCallback(_channelTag: string): number { return 0; }
  clearStatsEventCallback(_channelTag: string): number { return 0; }
  setChannelProfile(_channelTag: string, _profile: number): number { return ERROR_NOT_SUPPORTED; }

  enableMediaPub(channelTag: string, mediaType: number, enable: boolean): number {
    return this.channel(channelTag)?.enableMediaPub(mediaType, enable) ?? ERROR_NOT_SUPPORTED;
  }

  joinChannel(channelTag: string, request: Pigeon.JoinChannelRequest): number {
    return this.channel(channelTag)?.joinChannel(
      request.getToken() ?? '', request.getChannelName() ?? '', uid(request.getUid() ?? 0),
      request.getChannelOptions() as Any as NERtcConstants.NERtcJoinChannelOptions,
    ) ?? ERROR_NOT_SUPPORTED;
  }

  leaveChannel(channelTag: string): number {
    return this.channel(channelTag)?.leaveChannel() ?? ERROR_NOT_SUPPORTED;
  }

  setClientRole(channelTag: string, role: number): number {
    return this.channel(channelTag)?.setClientRole(role) ?? ERROR_NOT_SUPPORTED;
  }

  getConnectionState(channelTag: string): number {
    return this.channel(channelTag)?.getConnectionState() ?? ERROR_NOT_SUPPORTED;
  }

  release(channelTag: string): number {
    const channel = this.channel(channelTag);
    if (channel == null) return ERROR_NOT_SUPPORTED;
    channel.release();
    this.channels.delete(channelTag);
    return 0;
  }

  enableLocalAudio(channelTag: string, enable: boolean): number {
    return this.channel(channelTag)?.enableLocalAudio(enable) ?? ERROR_NOT_SUPPORTED;
  }

  muteLocalAudioStream(channelTag: string, mute: boolean): number {
    return this.channel(channelTag)?.muteLocalAudioStream(mute) ?? ERROR_NOT_SUPPORTED;
  }

  subscribeRemoteAudio(channelTag: string, userId: number, subscribe: boolean): number {
    return this.channel(channelTag)?.subscribeRemoteAudioStream(uid(userId), subscribe) ?? ERROR_NOT_SUPPORTED;
  }

  subscribeRemoteSubAudio(channelTag: string, userId: number, subscribe: boolean): number {
    return this.channel(channelTag)?.subscribeRemoteSubStreamAudio(uid(userId), subscribe) ?? ERROR_NOT_SUPPORTED;
  }

  enableLocalVideo(channelTag: string, request: Pigeon.EnableLocalVideoRequest): number {
    return this.channel(channelTag)?.enableLocalVideo(
      request.getEnable() ?? false, request.getStreamType() ?? 0) ??
      ERROR_NOT_SUPPORTED;
  }

  muteLocalVideoStream(channelTag: string, mute: boolean, streamType: number): number {
    return this.channel(channelTag)?.muteLocalVideo(streamType, mute) ?? ERROR_NOT_SUPPORTED;
  }

  switchCamera(channelTag: string): number {
    return this.channel(channelTag)?.switchCamera() ?? ERROR_NOT_SUPPORTED;
  }

  subscribeRemoteVideoStream(channelTag: string, request: Pigeon.SubscribeRemoteVideoStreamRequest): number {
    return this.channel(channelTag)?.subscribeRemoteVideo(
      uid(request.getUid() ?? 0), request.getSubscribe() ?? false, 0, request.getStreamType() ?? 0) ??
      ERROR_NOT_SUPPORTED;
  }

  subscribeRemoteSubVideoStream(channelTag: string, userId: number, subscribe: boolean): number {
    return this.channel(channelTag)?.subscribeRemoteSubStreamVideo(uid(userId), subscribe) ?? ERROR_NOT_SUPPORTED;
  }

  enableAudioVolumeIndication(channelTag: string, request: Pigeon.EnableAudioVolumeIndicationRequest): number {
    return this.channel(channelTag)?.enableAudioVolumeIndication(
      request.getEnable() ?? false, BigInt(request.getInterval() ?? 0), request.getVad() ?? false) ??
      ERROR_NOT_SUPPORTED;
  }
}

class OhosDeviceApi extends Pigeon.DeviceManagerApi {
  private engine() { return NERtcSDK.getInstance(); }
  isSpeakerphoneOn(): boolean { return this.engine().isSpeakerphoneOn(); }
  isCameraZoomSupported(): boolean { return this.engine().isCameraZoomSupported(); }
  isCameraTorchSupported(): boolean { return this.engine().isCameraTorchSupported(); }
  isCameraFocusSupported(): boolean { return this.engine().isCameraFocusSupported(); }
  isCameraExposurePositionSupported(): boolean { return this.engine().isCameraExposurePositionSupported(); }
  setSpeakerphoneOn(enable: boolean): number { return this.engine().setSpeakerphoneOn(enable); }
  switchCamera(): number { return this.engine().switchCamera(); }
  setCameraZoomFactor(factor: number): number { return this.engine().setCameraZoomFactor(factor); }
  getCameraMaxZoom(): number { return this.engine().getCameraMaxZoom(); }
  setCameraTorchOn(on: boolean): number { return this.engine().setCameraTorchOn(on); }
  setCameraFocusPosition(request: Pigeon.SetCameraPositionRequest): number {
    return this.engine().setCameraFocusPosition(request.getX() ?? 0, request.getY() ?? 0);
  }
  setCameraExposurePosition(request: Pigeon.SetCameraPositionRequest): number {
    return this.engine().setCameraExposurePosition(request.getX() ?? 0, request.getY() ?? 0);
  }
  setPlayoutDeviceMute(mute: boolean): number { return this.engine().setPlayoutDeviceMute(mute); }
  isPlayoutDeviceMute(): boolean { return this.engine().isPlayoutDeviceMute(); }
  setRecordDeviceMute(mute: boolean): number { return this.engine().setRecordDeviceMute(mute); }
  isRecordDeviceMute(): boolean { return this.engine().isRecordDeviceMute(); }
  enableEarback(enable: boolean, volume: number): number { return this.engine().enableEarback(enable, volume); }
  setEarbackVolume(volume: number): number { return this.engine().setEarbackVolume(volume); }
  setAudioFocusMode(_focusMode: number): number { return ERROR_NOT_SUPPORTED; }
  getCurrentCamera(): number { return this.engine().getCurrentCameraPosition(); }
  switchCameraWithPosition(position: number): number { return this.engine().switchCameraWithPosition(position); }
  getCameraCurrentZoom(): number { return this.engine().getCameraCurrentZoom(); }
}

class OhosAudioMixingApi extends Pigeon.AudioMixingApi {
  private engine() { return NERtcSDK.getInstance(); }
  startAudioMixing(request: Pigeon.StartAudioMixingRequest): number {
    const option: NERtcConstants.NERtcCreateAudioMixingOption = {
      path: request.getPath() ?? '',
      loopCount: request.getLoopCount() ?? 1,
      sendEnabled: request.getSendEnabled() ?? true,
      sendVolume: request.getSendVolume() ?? 100,
      playbackEnabled: request.getPlaybackEnabled() ?? true,
      playbackVolume: request.getPlaybackVolume() ?? 100,
      startTimeStamp: BigInt(request.getStartTimeStamp() ?? 0),
      sendWithAudioType: (request.getSendWithAudioType() ?? 0) as NERtcConstants.NERtcAudioStreamType,
      progressInterval: BigInt(request.getProgressInterval() ?? 1000),
    };
    return this.engine().startAudioMixing(option);
  }
  stopAudioMixing(): number { return this.engine().stopAudioMixing(); }
  pauseAudioMixing(): number { return this.engine().pauseAudioMixing(); }
  resumeAudioMixing(): number { return this.engine().resumeAudioMixing(); }
  setAudioMixingSendVolume(volume: number): number { return this.engine().setAudioMixingSendVolume(volume); }
  getAudioMixingSendVolume(): number { return this.engine().getAudioMixingSendVolume(); }
  setAudioMixingPlaybackVolume(volume: number): number { return this.engine().setAudioMixingPlaybackVolume(volume); }
  getAudioMixingPlaybackVolume(): number { return this.engine().getAudioMixingPlaybackVolume(); }
  getAudioMixingDuration(): number { return Number(this.engine().getAudioMixingDuration()); }
  getAudioMixingCurrentPosition(): number { return Number(this.engine().getAudioMixingCurrentPosition()); }
  setAudioMixingPosition(position: number): number { return this.engine().setAudioMixingPosition(BigInt(position)); }
  setAudioMixingPitch(pitch: number): number { return this.engine().setAudioMixingPitch(pitch); }
  getAudioMixingPitch(): number { return this.engine().getAudioMixingPitch(); }
}

class OhosAudioEffectApi extends Pigeon.AudioEffectApi {
  private engine() { return NERtcSDK.getInstance(); }
  playEffect(request: Pigeon.PlayEffectRequest): number {
    return this.engine().playEffect(
      request.getEffectId(), request as Any as NERtcConstants.NERtcCreateAudioEffectOption);
  }
  stopEffect(effectId: number): number { return this.engine().stopEffect(effectId); }
  stopAllEffects(): number { return this.engine().stopAllEffects(); }
  pauseEffect(effectId: number): number { return this.engine().pauseEffect(effectId); }
  resumeEffect(effectId: number): number { return this.engine().resumeEffect(effectId); }
  pauseAllEffects(): number { return this.engine().pauseAllEffects(); }
  resumeAllEffects(): number { return this.engine().resumeAllEffects(); }
  setEffectSendVolume(effectId: number, volume: number): number {
    return this.engine().setEffectSendVolume(effectId, volume);
  }
  getEffectSendVolume(effectId: number): number { return this.engine().getEffectSendVolume(effectId); }
  setEffectPlaybackVolume(effectId: number, volume: number): number {
    return this.engine().setEffectPlaybackVolume(effectId, volume);
  }
  getEffectPlaybackVolume(effectId: number): number { return this.engine().getEffectPlaybackVolume(effectId); }
  getEffectDuration(effectId: number): number { return Number(this.engine().getEffectDuration(effectId)); }
  getEffectCurrentPosition(effectId: number): number { return Number(this.engine().getEffectCurrentPosition(effectId)); }
  setEffectPitch(effectId: number, pitch: number): number { return this.engine().setEffectPitch(effectId, pitch); }
  getEffectPitch(effectId: number): number { return this.engine().getEffectPitch(effectId); }
  setEffectPosition(effectId: number, position: number): number {
    return this.engine().setEffectPosition(effectId, BigInt(position));
  }
}

class OhosVideoRendererApi extends Pigeon.VideoRendererApi {
  private nextRendererId = 1;
  private engine() { return NERtcSDK.getInstance(); }
  private canvas(textureId: number): NERtcConstants.NERtcVideoCanvas {
    return { canvasId: `${textureId}` } as NERtcConstants.NERtcVideoCanvas;
  }
  createVideoRenderer(): number { return this.nextRendererId++; }
  setMirror(_textureId: number, _mirror: boolean): number { return 0; }
  setupLocalVideoRenderer(textureId: number, _channelTag: string): number {
    return this.engine().setupLocalVideoCanvas(this.canvas(textureId));
  }
  setupRemoteVideoRenderer(userId: number, textureId: number, _channelTag: string): number {
    return this.engine().setupRemoteVideoCanvas(this.canvas(textureId), uid(userId));
  }
  setupLocalSubStreamVideoRenderer(textureId: number, _channelTag: string): number {
    return this.engine().setupLocalSubStreamVideoCanvas(this.canvas(textureId));
  }
  setupRemoteSubStreamVideoRenderer(userId: number, textureId: number, _channelTag: string): number {
    return this.engine().setupRemoteSubStreamVideoCanvas(this.canvas(textureId), uid(userId));
  }
  setupPlayStreamingCanvas(streamId: string, textureId: number): number {
    return this.engine().setupPlayStreamingCanvas(streamId, this.canvas(textureId));
  }
  disposeVideoRenderer(_textureId: number): void {}
}

export class NERtcPigeonApi {
  private readonly messenger: BinaryMessenger;
  private readonly engineApi: OhosEngineApi;
  private readonly channelApi: OhosChannelApi;
  private readonly deviceApi = new OhosDeviceApi();
  private readonly mixingApi = new OhosAudioMixingApi();
  private readonly effectApi = new OhosAudioEffectApi();
  private readonly rendererApi = new OhosVideoRendererApi();

  constructor(messenger: BinaryMessenger) {
    this.messenger = messenger;
    const engineEvents = new Pigeon.NERtcChannelEventSink(messenger);
    const channelEvents = new Pigeon.NERtcSubChannelEventSink(messenger);
    const deviceEvents = new Pigeon.NERtcDeviceEventSink(messenger);
    const mixingEvents = new Pigeon.NERtcAudioMixingEventSink(messenger);
    const effectEvents = new Pigeon.NERtcAudioEffectEventSink(messenger);
    this.channelApi = new OhosChannelApi(channelEvents);
    this.engineApi = new OhosEngineApi(
      new EngineCallback(engineEvents, deviceEvents, mixingEvents, effectEvents), this.channelApi);
  }

  start(): void {
    Pigeon.EngineApi.setup(this.messenger, this.engineApi);
    Pigeon.ChannelApi.setup(this.messenger, this.channelApi);
    Pigeon.DeviceManagerApi.setup(this.messenger, this.deviceApi);
    Pigeon.AudioMixingApi.setup(this.messenger, this.mixingApi);
    Pigeon.AudioEffectApi.setup(this.messenger, this.effectApi);
    Pigeon.VideoRendererApi.setup(this.messenger, this.rendererApi);
  }

  stop(): void {
    Pigeon.EngineApi.setup(this.messenger, null);
    Pigeon.ChannelApi.setup(this.messenger, null);
    Pigeon.DeviceManagerApi.setup(this.messenger, null);
    Pigeon.AudioMixingApi.setup(this.messenger, null);
    Pigeon.AudioEffectApi.setup(this.messenger, null);
    Pigeon.VideoRendererApi.setup(this.messenger, null);
    this.channelApi.clear();
  }

  createChannel(channelTag: string): number {
    return this.channelApi.create(channelTag);
  }
}
