/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#include "ABI44_0_0TextProps.h"

namespace ABI44_0_0facebook {
namespace ABI44_0_0React {

TextProps::TextProps(const TextProps &sourceProps, const RawProps &rawProps)
    : Props(sourceProps, rawProps),
      BaseTextProps::BaseTextProps(sourceProps, rawProps){};

#pragma mark - DebugStringConvertible

#if ABI44_0_0RN_DEBUG_STRING_CONVERTIBLE
SharedDebugStringConvertibleList TextProps::getDebugProps() const {
  return BaseTextProps::getDebugProps();
}
#endif

} // namespace ABI44_0_0React
} // namespace ABI44_0_0facebook
