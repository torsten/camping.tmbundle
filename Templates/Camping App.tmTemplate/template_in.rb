%w*ubygems camping*.each{|_|require _}


Camping.goes :${TM_APP_NAME}


module ${TM_APP_NAME}

  def r500(k,m,x)
    env = @env
    r(500, Mab.new { 
      h1 '#500'
      dl do
        dt do
          strong x.class.to_s
          text " from #{k}.#{m}:"
        end
        dd x.message
      end

      # produce some nice, clickable error output
      if env.REMOTE_ADDR == '127.0.0.1'
        ul do x.backtrace.each do |bt|
          li do
            a bt, :href =>
              bt.gsub(/^(.+):(\d+).*$/, 'txmt://open/?line=\2&url=file://\1')
          end unless bt =~ %r{^\(eval\):|lib/mongrel|lib/markaby}
        end end
      else
        # TODO: handle this somehow by sending mails or something
        text "Please mail me a screenshot of this."
      end
    }.to_s)
  end

  def r404(p)
    r(404, Mab.new { h1 "#404"; text "#{p.gsub('<', '&lt;')} not found"})
  end
  
end


module ${TM_APP_NAME}::Controllers
  
  class Index < R '/'
    def get
      render :index
    end
  end
  
end


module ${TM_APP_NAME}::Views
  
  def index
    h1 "${TM_APP_NAME}"
  end
  
  def layout
    xhtml_strict do
      head do
        title "${TM_APP_NAME}"
      end
      
      body do
        self << yield
      end
      
    end
    
  end
  
end


module ${TM_APP_NAME}::Helpers
end


# def ${TM_APP_NAME}.create
# end
