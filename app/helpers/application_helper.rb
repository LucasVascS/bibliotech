module ApplicationHelper
  def flash_messages
    messages = ""
    main_type = "info"

    flash.each do |key, message|
      if message.present?
        messages << <<-EOF
          <div class="alert alert-#{(key=='notice'? main_type : key)} alert-dismissible fade show" role="alert">
            #{message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        EOF
      end

      flash[key] = nil
    end

    raw messages
  end
    
end
