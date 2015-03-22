use Rack::Static,
  urls: %w( /images /js /css /fonts ),
  root: "public"

countries = %w( toskania portugalia baltyki paneuropa islandia spitsbergen lanzarote rpa seszele meksyk nowazelandia dubaj chiny japonia singapur )

countries.each do |country|
  map "/#{country}" do
    run lambda { |env|
      [
        200,
        {
          'Content-Type'  => 'text/html',
          'Cache-Control' => 'public, max-age=86400'
        },
        File.open("public/#{country}.html", File::RDONLY)
      ]
    }
  end
end

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
