# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

#[RuntimeError at / Refile.secret_key was not set.]のエラーの解消方法
Refile.secret_key = '0ab8f6590ff742256445a30621a452a359b75470a311e8d5daab769123243250d68c9df9e84677c1436b66ee95ba000f420f63e4d32d864a4ca0d6ab62ef6bd4'