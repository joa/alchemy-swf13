package {
import flash.display.*
import flash.events.*
import flash.net.*
import flash.text.*
public class Main extends Sprite {
  private const tf: TextField = new TextField()
  public function Main() {
    tf.multiline = true
    tf.autoSize = "left"
  
    addChild(tf)

    trace("main")
    trace("loading library.swf ...")

    const loader: Loader = new Loader()
    const i: LoaderInfo = loader.contentLoaderInfo

    i.addEventListener(Event.COMPLETE, complete)
    i.addEventListener(HTTPStatusEvent.HTTP_STATUS, t("status"))
    i.addEventListener(Event.INIT, t("init"))
    i.addEventListener(IOErrorEvent.IO_ERROR, t("ioerr"))
    i.addEventListener(Event.OPEN, t("open"))
    i.addEventListener(ProgressEvent.PROGRESS, t("progress"))
    i.addEventListener(Event.UNLOAD, t("unload"))

    loader.load(new URLRequest("library.swf"))
  }
  
  private function onComplete(event: Event): void {
    trace("load-complete")
  }

  private function t(label: String): Function {
    return function(event: Event): void {
      trace(label, event)
    }
  }

  private function complete(event: Event): void {
    const loaderInfo: LoaderInfo = LoaderInfo(event.target)
    const klass: Class = Class(loaderInfo.applicationDomain.getDefinition("Alc"))

    trace("class ", klass)

    const inst: Object  = new klass();

    trace("instance", inst)

    inst.init()

    trace("sqrt(2.0) =", inst.foo(2.0))
  }

  private function trace(... rest): void {
    tf.appendText(rest.join(' ')+'\n')
  }
}
}
