/////////////////////////////////////////////////////////////////////
// Copyright (c) 2022 Maciej Patro.
// Distributed under the Mozilla Public License 2.0
// for more information read LICENSE file.
/////////////////////////////////////////////////////////////////////

#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <ci_testing/ci_testing.hpp>
#include <doctest/doctest.h>

namespace ci_testing {

TEST_CASE("Passing test case")
{
  REQUIRE(tested_function());
}

} // namespace ci_testing
