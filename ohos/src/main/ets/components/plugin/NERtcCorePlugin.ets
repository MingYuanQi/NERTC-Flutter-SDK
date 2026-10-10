import {
  AbilityAware,
  AbilityPluginBinding,
  FlutterPlugin,
  FlutterPluginBinding,
} from '@ohos/flutter_ohos';
import { NERtcVideoPlatformViewFactory } from '../video/NERtcVideoPlatformView';
import { NERtcPigeonApi } from './NERtcPigeonApi';

export default class NERtcCorePlugin implements FlutterPlugin, AbilityAware {
  private pigeonApi: NERtcPigeonApi | null = null;

  getUniqueClassName(): string {
    return 'NERtcCorePlugin';
  }

  onAttachedToAbility(_binding: AbilityPluginBinding): void {}

  onDetachedFromAbility(): void {}

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    const messenger = binding.getBinaryMessenger();
    this.pigeonApi = new NERtcPigeonApi(messenger);
    this.pigeonApi.start();
    binding.getPlatformViewRegistry().registerViewFactory(
      'nertc_core_ohos/video_view',
      new NERtcVideoPlatformViewFactory(messenger),
    );
  }

  onDetachedFromEngine(_binding: FlutterPluginBinding): void {
    this.pigeonApi?.stop();
    this.pigeonApi = null;
  }
}
