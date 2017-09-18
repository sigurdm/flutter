// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'box.dart';
import 'layer.dart';
import 'object.dart';

class TextureBox extends RenderBox {
  TextureBox({
    int textureId: null,
  }) : _textureId = textureId;

  int _textureId;

  set textureId(int value) {
    if (value != _textureId) {
      _textureId = value;
      markNeedsPaint();
    }
  }

  int get textureId => _textureId;

  @override
  bool get sizedByParent => true;

  @override
  bool get alwaysNeedsCompositing => true;


  @override
  bool get isRepaintBoundary => true;

  @override
  void performResize() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    assert(needsCompositing);
    if (_textureId == null) {
      return;
    }
    context.addLayer(new TextureLayer(
      textureRect: new Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
      textureId: _textureId,
    ));
  }
}
