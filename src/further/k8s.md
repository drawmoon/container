# K8S

## 会话保持

### 基于 Cookie 的会话保持

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/affinity: cookie
    nginx.ingress.kubernetes.io/session-cookie-expires: "172800"
    nginx.ingress.kubernetes.io/session-cookie-max-age: "172800"
    nginx.ingress.kubernetes.io/session-cookie-name: http-cookie
  name: myapp-ingress
  labels:
    app: myapp-ingress
spec:
  rules:
    - host: test.myapp.com
      http:
        paths:
          - pathType: Prefix
            path: "/"
            backend:
              service:
                name: myapp
                port:
                  number: 80
```