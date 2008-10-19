class Image < Attachment
  validates_format_of :content_type, :with => /(jpg|jpeg|png|gif)/, :message => "You must select a jpg, png or gif file to upload."
end
