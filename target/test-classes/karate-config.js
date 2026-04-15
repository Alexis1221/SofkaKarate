function fn() {
  karate.configure('ssl',true)
  var env = karate.env;
  var base_Url = '';



  if (!env) {
    env = 'dev';
  }
  if (env == 'dev') {
    karate.log('Ejecutando en ambiente DEV');
    base_Url = 'https://api.demoblaze.com';

  }

  var config = {
    env: env,
    base_Url: base_Url

  };

  return config;
}
