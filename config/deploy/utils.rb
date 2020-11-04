def load_env_from_file
  File.read("/home/deploy/.env").strip.split("\n").reduce({}) do |hash, element|
    raise "ENV file incorrect format" unless element.start_with?(/[A-Z]/) || element != element.strip

    k_v = element.gsub("export ", "").split("=")
    hash.merge k_v.first.downcase.to_sym => k_v.last
  end
end
