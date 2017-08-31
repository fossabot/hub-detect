/*
 * Copyright (C) 2017 Black Duck Software, Inc.
 * http://www.blackducksoftware.com/
 *
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.blackducksoftware.integration.hub.detect

import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component

import com.blackducksoftware.integration.hub.detect.help.ValueDescription

@Component
class DetectProperties {
    /**
     * This class is generated from the src/main/resources/detectProperties.fmt file.
     * Any necessary changes should be made there and then this class should be generated from the template.
     */

<#list groups as group>
    private static final String GROUP_${group.javaName} = '${group.textName}'
</#list>

<#list detectProperties as detectProperty>
    <#if detectProperty.description??>
        <#if detectProperty.defaultValue??>
    @ValueDescription(description='${detectProperty.description}', defaultValue='${detectProperty.defaultValue}', group=DetectProperties.GROUP_${detectProperty.group})
        <#else>
    @ValueDescription(description='${detectProperty.description}', group=DetectProperties.GROUP_${detectProperty.group})
        </#if>
    @Value('${"${"}${detectProperty.key}${"}"}')
    ${detectProperty.type} ${detectProperty.javaName}
    </#if>
</#list>

}