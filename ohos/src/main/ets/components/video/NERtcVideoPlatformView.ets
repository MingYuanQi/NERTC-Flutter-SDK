import {
  BinaryMessenger,
  PlatformView,
  PlatformViewFactory,
  StandardMessageCodec,
  MethodChannel,
  Any,
} from '@ohos/flutter_ohos';
import { Params } from '@ohos/flutter_ohos/src/main/ets/plugin/platform/PlatformView';
import { NERtcVideoView } from '@nertc/nertc_sdk';

@Component
struct NERtcVideoComponent {
  @Prop params: Params
  private platformView: NERtcVideoPlatformView =
    this.params.platformView as NERtcVideoPlatformView

  build() {
    NERtcVideoView({
      canvasId: this.platformView.canvasId,
      onLoad: () => this.platformView.onLoad(),
    })
  }
}

@Builder
function NERtcVideoBuilder(params: Params) {
  NERtcVideoComponent({ params: params })
}

export class NERtcVideoPlatformView extends PlatformView {
  readonly canvasId: string
  private readonly channel: MethodChannel

  constructor(viewId: number, args: Any, messenger: BinaryMessenger) {
    super()
    const values = args as Map<string, Object>
    this.canvasId = `${values.get('rendererId') ?? viewId}`
    this.channel = new MethodChannel(messenger, `nertc_core_ohos/video_view/${this.canvasId}`)
  }

  onLoad(): void {
    this.channel.invokeMethod('onLoad', new Map<string, Object>())
  }

  getView(): WrappedBuilder<[Params]> {
    return new WrappedBuilder(NERtcVideoBuilder)
  }

  dispose(): void {}
}

export class NERtcVideoPlatformViewFactory extends PlatformViewFactory {
  private readonly messenger: BinaryMessenger

  constructor(messenger: BinaryMessenger) {
    super(StandardMessageCodec.INSTANCE)
    this.messenger = messenger
  }

  create(_context: Context, viewId: number, args: Any): PlatformView {
    return new NERtcVideoPlatformView(viewId, args, this.messenger)
  }
}
