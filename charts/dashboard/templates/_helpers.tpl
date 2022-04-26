{{/*
Expand the name of the chart.
*/}}
{{- define "enabler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "enabler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "enabler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the main interface.
*/}}
{{- define "main.name" -}}
{{ include "enabler.name" . }}-main
{{- end }}

{{/*
Main labels
*/}}
{{- define "main.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "main.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Main selector labels
*/}}
{{- define "main.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
component: {{ .Values.main.name }}
isMainInterface: "yes"
tier: {{ .Values.main.tier}}
{{- end }}

{{/*
Name of the component dashboard.
*/}}
{{- define "dashboard.name" -}}
{{ include "enabler.name" . }}-dashboard
{{- end }}

{{/*
Component dashboard labels
*/}}
{{- define "dashboard.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "dashboard.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component dashboard selector labels
*/}}
{{- define "dashboard.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
component: {{ .Values.dashboard.name }}
isMainInterface: "yes"
tier: {{ .Values.dashboard.tier}}
{{- end }}

{{/*
Name of the component backend.
*/}}
{{- define "backend.name" -}}
{{ include "enabler.name" . }}-backend
{{- end }}

{{/*
Component backend labels
*/}}
{{- define "backend.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component backend selector labels
*/}}
{{- define "backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
component: {{ .Values.backend.name }}
isMainInterface: "no"
tier: {{ .Values.backend.tier}}
{{- end }}

{{/*
Name of the component db.
*/}}
{{- define "db.name" -}}
{{ include "enabler.name" . }}-db
{{- end }}

{{/*
Component db labels
*/}}
{{- define "db.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "db.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component db selector labels
*/}}
{{- define "db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
component: {{ .Values.db.name }}
isMainInterface: "no"
tier: {{ .Values.db.tier}}
{{- end }}

