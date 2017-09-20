// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'framework.dart';

/// A [Widget] that is backed by an external image stream.
class ExternalImage extends LeafRenderObjectWidget {
  const ExternalImage({ Key key, @required this.imageId }): super(key: key);

  final int imageId;

  @override
  ExternalImageBox createRenderObject(BuildContext context) => new ExternalImageBox(imageId: imageId);

  @override
  void updateRenderObject(BuildContext context, ExternalImageBox renderObject) {
    renderObject.imageId = imageId;
  }
}
