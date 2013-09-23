// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dw.conference.web;

import com.dw.conference.domain.Speaker;
import com.dw.conference.domain.Talk;
import com.dw.conference.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Speaker, String> ApplicationConversionServiceFactoryBean.getSpeakerToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.dw.conference.domain.Speaker, java.lang.String>() {
            public String convert(Speaker speaker) {
                return new StringBuilder().append(speaker.getFirstname()).append(' ').append(speaker.getLastname()).append(' ').append(speaker.getEmail()).append(' ').append(speaker.getOrganization()).toString();
            }
        };
    }
    
    public Converter<Long, Speaker> ApplicationConversionServiceFactoryBean.getIdToSpeakerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.dw.conference.domain.Speaker>() {
            public com.dw.conference.domain.Speaker convert(java.lang.Long id) {
                return Speaker.findSpeaker(id);
            }
        };
    }
    
    public Converter<String, Speaker> ApplicationConversionServiceFactoryBean.getStringToSpeakerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.dw.conference.domain.Speaker>() {
            public com.dw.conference.domain.Speaker convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Speaker.class);
            }
        };
    }
    
    public Converter<Talk, String> ApplicationConversionServiceFactoryBean.getTalkToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.dw.conference.domain.Talk, java.lang.String>() {
            public String convert(Talk talk) {
                return new StringBuilder().append(talk.getTitle()).append(' ').append(talk.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Talk> ApplicationConversionServiceFactoryBean.getIdToTalkConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.dw.conference.domain.Talk>() {
            public com.dw.conference.domain.Talk convert(java.lang.Long id) {
                return Talk.findTalk(id);
            }
        };
    }
    
    public Converter<String, Talk> ApplicationConversionServiceFactoryBean.getStringToTalkConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.dw.conference.domain.Talk>() {
            public com.dw.conference.domain.Talk convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Talk.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getSpeakerToStringConverter());
        registry.addConverter(getIdToSpeakerConverter());
        registry.addConverter(getStringToSpeakerConverter());
        registry.addConverter(getTalkToStringConverter());
        registry.addConverter(getIdToTalkConverter());
        registry.addConverter(getStringToTalkConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}