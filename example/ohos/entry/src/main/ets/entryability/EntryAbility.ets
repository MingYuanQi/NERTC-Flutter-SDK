
import {
  FlutterAbility,
  FlutterEngine,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { GeneratedPluginRegistrant } from '../plugins/GeneratedPluginRegistrant';

const PERMISSION_CHANNEL = 'nertc_core_example/permissions'

export default class EntryAbility extends FlutterAbility implements MethodCallHandler {
  configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    GeneratedPluginRegistrant.registerWith(flutterEngine)
    const messenger = flutterEngine.getDartExecutor().getBinaryMessenger()
    new MethodChannel(messenger, PERMISSION_CHANNEL).setMethodCallHandler(this)
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method !== 'requestMediaPermissions') {
      result.notImplemented()
      return
    }

    const permissions: Array<Permissions> = [
      'ohos.permission.MICROPHONE',
      'ohos.permission.CAMERA',
    ]
    abilityAccessCtrl.createAtManager()
      .requestPermissionsFromUser(this.context, permissions)
      .then((permissionResult) => {
        const granted = permissionResult.authResults.every(
          (status) => status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)
        result.success(granted)
      })
      .catch((error: Error) => {
        result.error('permission_error', error.message, error)
      })
  }
}
