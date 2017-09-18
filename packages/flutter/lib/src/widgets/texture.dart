// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'framework.dart';
import 'transitions.dart';

class Texture extends LeafRenderObjectWidget {
  const Texture({
    @required this.textureId,
  });

  final int textureId;

  @override
  TextureBox createRenderObject(BuildContext context) => new TextureBox(
    textureId: textureId,
  );

  @override
  void updateRenderObject(BuildContext context, TextureBox renderObject) {
    renderObject.textureId = textureId;
  }
}

class AnimatedTexture extends AnimatedWidget {

  AnimatedTexture(Listenable listenable) : super(listenable);

  @override
  Widget build(BuildContext context) {
    return const Texture(textureId: 0);
  }
}