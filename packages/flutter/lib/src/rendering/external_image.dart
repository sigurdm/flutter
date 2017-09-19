// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'box.dart';
import 'layer.dart';
import 'object.dart';

class ExternalImageBox extends RenderBox {
  ExternalImageBox({
    int imageId: null,
  }) : _imageId = imageId;

  int _imageId;

  set textureId(int value) {
    if (value != _imageId) {
      _imageId = value;
      markNeedsPaint();
    }
  }

  int get textureId => _imageId;

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
    if (_imageId == null) {
      return;
    }
    context.addLayer(new ExternalImageLayer(
      rect: new Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
      imageId: _imageId,
    ));
  }
}
