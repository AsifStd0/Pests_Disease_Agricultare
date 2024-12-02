import 'package:googleapis_auth/auth_io.dart';

class ServiceKey{
  Future<String> getServerKeyToken() async {
   final  scope =[
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/firebase.database',
    'https://www.googleapis.com/auth/firebase.messaging',
   ];
    final client = await 
    clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
{
  "type": "service_account",
  "project_id": "agricultare-weather-pests",
  "private_key_id": "87f1d3dfcea186bb8b545982186900ec8f449fa6",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC5Bg44oSahTl/7\n7RVuR3pR6CLIi6rlg/1eICMUB3P2FSYOaHsB0E8NjGqd53kVk/Qp/iGPnT8zuIlC\nG+nzQ3wXsra3wsVHEj+KCtkKgotHZff4r1sqYSQH3QHGw8XFwG8txDJve45jtvU+\ntOFNYngfdAMoBjiW3BzbkdWVQVMcwjH7LpB3kB5/IA3ldyObu3TML5sQhWfyYGit\nnDPHybxlIeMI2JVhxV/+nMCFB9dWBureKdCuoojhzXQ8rUeUQ/oiqKGMOfaI8xXa\nuMHQENjDIwj/l+lL2Bd3mdmNECtCC1VuisYQDWug6vpqx97NOZ6VJxKSXUA2CKo5\nVr1GJcZVAgMBAAECggEABjFDxmqYVHjpy/tMRr0EL5vCwZkGaXjrK4cM/YA0BfCr\nwyWFNmiTzhWHbPerYl4/DgJoJPpuPCt+hon7dhg/CJEDPgUPXWNTi+nJ3VOaAz6l\nrRBQugtMbX9HWQZs3FiQ2q8wwUaZRlDq24QqGpEDibP0Nhb34Q6xYDo83n+0SdJO\n+q46Lp0nuFPO/JSFFJ7+tVvV4g+VG+BBkx2FHby+xg54ED95UwNyx+tRjWKUOUDt\nXMA79lhvrmbL3Kne6PctMb4Ya2Dj7lu8IadWfQfK3GWypKKjXLIZO33e/tKALfN+\n5zGXCWg/leRFfdZ0A5Y23jysWPs56YOCEW/dHM31aQKBgQD9bN9Fj+K+BgLwXHF+\nX/VD9QZAIy0Nc0HsEm03VBPs2yYBC0cvvJ6GK+JCAEe33ARQ9XZ3/t8m3mwNJEX6\ns183VXIcvRk7tdZvfqZQ+kdNNsgrb2BTvsxgqEG1rs4K1TKkTU9J6WhaIegOvzbf\nUYiyMGBCJzFicsN9SswfIfpbjQKBgQC650d6qLrJ/koew5T9MHuuBbwN9RTVsR38\nm0oJWRE0kUKHWOus/0BgaxXnNyZ3rDfPCou3i5+MhAAt5qWdzJDTYmCLsr182arY\noxNyBv9kQJJ+cT7jhlvbCewORfBPiz1LxZCenFr52G4gEj3FEsxEx7mRK+ALY5Mw\nQ7h9ZzP/6QKBgQC+E+Gm6BPWGOYtZ/jMI6bvMKFei8On2fHw4aU/IXXMalan49Ch\n0mRIGDQc8t7X3VLzchhISkcPfTYn6TP/pHffJdxwB7kcWveaKrEN/ZprJJKgWWoz\nheD/AlQ+s/zgjSXtq/qzYjidmd7W6L58Y0gW9kfMdl8JCzDrEaXmF/MSpQKBgFc1\n29CMMrxV/1fjgv2xRcSpwFny5cngX1GjVCSQfsq8jQKCp1WNtQhIb2v3++cTYOcm\n0JLQf54dacgBO34qGdnIqawFtw0us91qGoS2ZyzsRG7jgKjB5NKMCq2OTNeQ7QUS\nJq0b4Ad8ycYFPPVcFBxz5U6r3lryF5gJwWgiY80hAoGAe1xtmOOmNU8x+qkws349\nQHxAmLKKvdbNtogfcLetGReuy0Rk37cMcP+278sAzW/xJiQ7dC/rsEVxwNUX1agm\nIl8OuPK8BZYQy97/V0m8R9lVSkPcR3XjsbU2JDCNexFBaMisc24jxuxPfBBGl3Nz\ns/1mVwosKEekkQ6rarfnpPc=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-il5rq@agricultare-weather-pests.iam.gserviceaccount.com",
  "client_id": "112618757427096740369",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-il5rq%40agricultare-weather-pests.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
},
      ),
      scope, 
      
      );
      final accessServiceKeyClient = client.credentials.accessToken.data;
    return accessServiceKeyClient;   
  }
}