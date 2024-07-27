{{- define "kxi-helm-charts.deployment"}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "kxi-helm-charts.fullname" . }}
  labels:
    app: {{ include "kxi-helm-charts.name" . }}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: {{ include "kxi-helm-charts.name" . }}
  template:
    metadata:
      labels:
        app: {{ include "kxi-helm-charts.name" . }}
    spec:
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          ports:
            - name: http
              containerPort: 8080

{{- end}}