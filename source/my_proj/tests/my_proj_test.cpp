/////////////////////////////////////////////////////////////////////
// Copyright (c) 2022 Maciej Patro.
// Distributed under the Boost Software License 1.0
// for more information read LICENSE file.
/////////////////////////////////////////////////////////////////////

#include <my_proj/my_proj.hpp>
#include <gtest/gtest.h>

namespace my_proj {

TEST(MyProj, PassingTestCase)
{
  EXPECT_TRUE(tested_function());
}

} // namespace my_proj
