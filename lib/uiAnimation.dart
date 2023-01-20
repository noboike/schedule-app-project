import 'dart:math';
import 'dart:async';

double easeOutBounce(x) {
const n1 = 7.5625;
const d1 = 2.75;

if (x < 1 / d1) {
    return n1 * x * x;
} else if (x < 2 / d1) {
    return n1 * (x -= 1.5 / d1) * x + 0.75;
} else if (x < 2.5 / d1) {
    return n1 * (x -= 2.25 / d1) * x + 0.9375;
} else {
    return n1 * (x -= 2.625 / d1) * x + 0.984375;
}
}

double easeOutExpo(x) {
  const c1 = 1.70158;
  const c3 = c1 + 1;

  return 1 + c3 * pow(x - 1, 3) + c1 * pow(x - 1, 2);
}

double easeOutBack(x) {
  const c1 = 1.70158;
  const c3 = c1 + 1;

  return 1 + c3 * pow(x - 1, 3) + c1 * pow(x - 1, 2);
}

double easeInBack(x) {
  const c1 = 1.70158;
  const c3 = c1 + 1;

  return c3 * x * x * x - c1 * x * x;
}

double easeInOutExpo(x) {
return x == 0
  ? 0
  : x == 1
  ? 1
  : x < 0.5 ? pow(2, 20 * x - 10) / 2
  : (2 - pow(2, -20 * x + 10)) / 2;
}

void fixKeyframe(keyframe) {
  if (!keyframe.containsKey('currentTime')) {
    keyframe['currentTime'] = DateTime.now();
  }
  if (!keyframe.containsKey('duration')) {
    keyframe['duration'] = 1000.0;
  }
  if (!keyframe.containsKey('beginTime')) {
    keyframe['beginTime'] = null;
  }
  if (!keyframe.containsKey('beginTimeSetted')) {
    keyframe['beginTimeSetted'] = false;
  }
  if (!keyframe.containsKey('endTime')) {
    keyframe['endTime'] = null;
  }
  if (!keyframe.containsKey('target')) {
    keyframe['target'] = null;
  }
  if (!keyframe.containsKey('repeat')) {
    keyframe['repeat'] = false;
  }
  if (!keyframe.containsKey('value')) {
    keyframe['value'] = [0.0, 100.0];
  }
  if (!keyframe.containsKey('porgress')) {
    keyframe['porgress'] = 0.0;
  }
  if (!keyframe.containsKey('delay')) {
    keyframe['delay'] = 0.0;
  }
  if (!keyframe.containsKey('nisted')) {
    keyframe['nisted'] = false;
  }
  if (!keyframe.containsKey('update')) {
    keyframe['update'] = () {};
  }
  if (!keyframe.containsKey('increase')) {
    keyframe['increase'] = false;
  }
  if (!keyframe.containsKey('end')) {
    keyframe['end'] = () {};
  }
  if (!keyframe.containsKey('endCalled')) {
    keyframe['endCalled'] = false;
  }
  if (!keyframe.containsKey('start')) {
    keyframe['start'] = () {};
  }
  if (!keyframe.containsKey('startCalled')) {
    keyframe['startCalled'] = false;
  }
}

void playAnimationKeyframe(keyframe) {
  fixKeyframe(keyframe);
  if (!keyframe['beginTimeSetted']) {
    keyframe['beginTimeSetted'] = true;
    keyframe['beginTime'] =
        DateTime.now().millisecondsSinceEpoch + keyframe['delay'];
    keyframe['endTime'] = keyframe['beginTime'] + keyframe['duration'];
  }
  keyframe['currentTime'] = DateTime.now().millisecondsSinceEpoch;
  if (keyframe['currentTime'] >= keyframe['beginTime']) {
    if (!keyframe['startCalled']) {
      keyframe['startCalled'] = true;
      keyframe['start']();
    }
    var diff = keyframe['endTime'] - keyframe['currentTime'];
    if (!keyframe['increase']) {
      diff = diff < 0 ? 0 : diff;
    }
    keyframe['porgress'] = (keyframe['duration'] - diff) / keyframe['duration'];
    var currentValue = keyframe['value'][0];
    if (keyframe['easing'] == "easeOut") {
      currentValue = keyframe['value'][0] +
          (keyframe['value'][1] - keyframe['value'][0]) *
              easeOutExpo(keyframe['porgress']);
    } else if (keyframe['easing'] == "easeOutBack") {
      currentValue = keyframe['value'][0] +
          (keyframe['value'][1] - keyframe['value'][0]) *
              easeOutBack(keyframe['porgress']);
    } else if (keyframe['easing'] == "easeInBack") {
      currentValue = keyframe['value'][0] +
          (keyframe['value'][1] - keyframe['value'][0]) *
              easeInBack(keyframe['porgress']);
    }else if (keyframe['easing'] == "easeInOutExpo") {
      currentValue = keyframe['value'][0] +
          (keyframe['value'][1] - keyframe['value'][0]) *
              easeInOutExpo(keyframe['porgress']);
    }else if (keyframe['easing'] == 'easeOutBounce') {
      currentValue = keyframe['value'][0] +
          (keyframe['value'][1] - keyframe['value'][0]) *
              easeOutBounce(keyframe['porgress']);
    } else {
      currentValue = keyframe['value'][0] +
          (keyframe['value'][1] - keyframe['value'][0]) * keyframe['porgress'];
    }
    if (keyframe['target'] != null) {
      keyframe['target']['value'] = currentValue;
    }
    if (keyframe['porgress'] == 1 && !keyframe['endCalled']) {
      keyframe['endCalled'] = true;
      keyframe['end']();
    }
    if (keyframe['repeat'] && keyframe['porgress'] == 1) {
      keyframe['beginTimeSetted'] = false;
      keyframe['endCalled'] = false;
    }
  }
  keyframe['update']();
}

void playAnimation(List keyframes, dynamic inOrder) {
  for (var i = 0; i < keyframes.length; i++) {
    if (inOrder == true) {
      if (i > 0) {
        fixKeyframe(keyframes[i]);
        keyframes[i]['delay'] +=
            (keyframes[i - 1]['delay'] + keyframes[i - 1]['duration']);
        if(keyframes[i]['nisted']) {
          keyframes[i]['delay'] = keyframes[i - 1]['delay'];
        }
      }
    }
    playAnimationKeyframe(keyframes[i]);
  }
}
