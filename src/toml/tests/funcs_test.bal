// (C) Copyright 2020 Hemika Kodikara.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import ballerina/test;
import ballerina/io;

@test:Config {}
public function tomlTest() {
    io:ReadableCharacterChannel tomlCharChannel = new(checkpanic io:openReadableFile("src/toml/tests/resources/test.toml"), "UTF-8");
    string tomlContent = <@untainted> checkpanic tomlCharChannel.read(50000);
    
    Toml toml = new(tomlContent);
    test:assertEquals(toml.getString("string_val"), "foo-bar");
    test:assertEquals(toml.getInt("int_val"), 666);
    test:assertEquals(toml.getBoolean("boolean_val"), true);
    test:assertEquals(toml.getFloat("float_val"), 3.14);
    string[] string_arr_val = ["ballerina", "Twitter", "endpoint", "connector"];
    test:assertEquals(toml.getStringArray("string_arr_val"), string_arr_val);
}
