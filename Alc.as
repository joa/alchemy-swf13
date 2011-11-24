package {
import apparat.math.*
public class Alc {
  public function init(): void {
    FastMath.initMemory()
  }

  public function foo(x: Number): Number {
    return FastMath.sqrt(x)
  }
}
}
