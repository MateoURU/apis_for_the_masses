require 'sinatra'


get '/gcd' do
  # Process the parameters. Example URL: http://localhost:4567/gcd?m=48&n=18
  m = params[:m].to_i
  n = params[:n].to_i

  # Euclid's Algorithm
  while n != 0
    m, n = n, m % n
  end

  "The GCD is #{m}"
end


