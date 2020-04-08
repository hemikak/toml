
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

import ballerina/java;

# Toml object
public type Toml object {
    handle tomlObj = getTomlNative();
    public function __init(string tomlContent) {
        self.tomlObj = readNative(self.tomlObj, java:fromString(tomlContent));
    }

    public function getString(string key) returns string? {
        return java:toString(getStringNative(self.tomlObj, java:fromString(key)));
    }

    public function getInt(string key) returns int {
        return getIntNative(self.tomlObj, java:fromString(key));
    }

    public function getBoolean(string key) returns boolean {
        return getBooleanNative(self.tomlObj, java:fromString(key));
    }

    public function getFloat(string key) returns float {
        return getFloatNative(self.tomlObj, java:fromString(key));
    }

    public function getStringArray(string key) returns string[] {
        handle nativeStringList = getStringListNative(self.tomlObj, java:fromString(key));
        int stringArrayLength = getStringListLengthNative(nativeStringList);

        string[] stringArray = [];
        foreach int i in 0 ... (stringArrayLength - 1){
            string? stringValue = java:toString(getStringByIndexNative(nativeStringList, i));
            if (stringValue is string) {
                stringArray[i] = stringValue;
            }
        }
        
        return stringArray;
    }
};

function getTomlNative() returns handle = @java:Constructor {
    class: "com.moandjiezana.toml.Toml"
} external;

function readNative(handle instance, handle content) returns handle = @java:Method {
    name: "read",
    class: "com.moandjiezana.toml.Toml",
    paramTypes: ["java.lang.String"]
} external;


function getStringNative(handle instance, handle key) returns handle = @java:Method {
  name: "getString",
  class: "com.moandjiezana.toml.Toml"
} external;

function getIntNative(handle instance, handle key) returns int = @java:Method {
  name: "getLong",
  class: "com.moandjiezana.toml.Toml"
} external;


function getBooleanNative(handle instance, handle key) returns boolean = @java:Method {
  name: "getBoolean",
  class: "com.moandjiezana.toml.Toml"
} external;


function getFloatNative(handle instance, handle key) returns float = @java:Method {
  name: "getDouble",
  class: "com.moandjiezana.toml.Toml"
} external;


function getStringListNative(handle instance, handle key) returns handle = @java:Method {
  name: "getList",
  class: "com.moandjiezana.toml.Toml"
} external;


function getStringListLengthNative(handle instance) returns int = @java:Method {
  name: "size",
  class: "java.util.List"
} external;


function getStringByIndexNative(handle instance, int index) returns handle = @java:Method {
  name: "get",
  class: "java.util.List"
} external;
