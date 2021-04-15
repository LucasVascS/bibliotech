module ApplicationHelper
  def flash_messages
    messages = ""

    flash.each do |type, message|
      if message.present?
        messages << <<-EOF
          <div class="alert alert-#{type} alert-dismissible fade show" role="alert">
            #{message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        EOF
      end

      flash[type] = nil
    end

    raw messages
  end
    
end
