// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'framework.dart';
import 'transitions.dart';

/// A [Widget] that is backed by an external image stream.
class ExternalImage extends LeafRenderObjectWidget {
  const ExternalImage({
    @required this.imageId,
  });

  final int imageId;

  @override
  ExternalImageBox createRenderObject(BuildContext context) =>
      new ExternalImageBox(
        imageId: imageId,
      );

  @override
  void updateRenderObject(BuildContext context, ExternalImageBox renderObject) {
    renderObject.textureId = imageId;
  }
}

class AnimatedExternalImage extends AnimatedWidget {
  final int imageId;

  AnimatedExternalImage(Listenable listenable, {this.imageId})
      : super(listenable: listenable);

  @override
  Widget build(BuildContext context) {
    return new ExternalImage(imageId: imageId);
  }
}
