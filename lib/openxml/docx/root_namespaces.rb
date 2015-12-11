module OpenXml
  module Docx
    module RootNamespaces

      POSSIBLE_NAMESPACES = {
        wpc: "http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas".freeze,
        mo: "http://schemas.microsoft.com/office/mac/office/2008/main".freeze,
        mv: "urn:schemas-microsoft-com:mac:vml".freeze,
        o: "urn:schemas-microsoft-com:office:office".freeze,
        r: "http://schemas.openxmlformats.org/officeDocument/2006/relationships".freeze,
        m: "http://schemas.openxmlformats.org/officeDocument/2006/math".freeze,
        v: "urn:schemas-microsoft-com:vml".freeze,
        wp14: "http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing".freeze,
        wp: "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing".freeze,
        w10: "urn:schemas-microsoft-com:office:word".freeze,
        w14: "http://schemas.microsoft.com/office/word/2010/wordml".freeze,
        w15: "http://schemas.microsoft.com/office/word/2012/wordml".freeze,
        wpg: "http://schemas.microsoft.com/office/word/2010/wordprocessingGroup".freeze,
        wpi: "http://schemas.microsoft.com/office/word/2010/wordprocessingInk".freeze,
        wne: "http://schemas.microsoft.com/office/word/2006/wordml".freeze,
        wps: "http://schemas.microsoft.com/office/word/2010/wordprocessingShape".freeze,
        w: "http://schemas.openxmlformats.org/wordprocessingml/2006/main".freeze,
        mc: "http://schemas.openxmlformats.org/markup-compatibility/2006".freeze,
        a: "http://schemas.openxmlformats.org/drawingml/2006/main".freeze,
        a14: "http://schemas.microsoft.com/office/drawing/2010/main".freeze,
        pic: "http://purl.oclc.org/ooxml/drawingml/main".freeze
      }

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods

        def use_namespaces(*args)
          args.each do |arg|
            prefix = arg.to_sym
            raise ArgumentError, "Reference to undefined namespace prefix: #{prefix}" if POSSIBLE_NAMESPACES[prefix].nil?
            active_namespaces << prefix unless active_namespaces.include?(prefix)
          end
        end
        alias :use_namespace :use_namespaces

        def can_ignore(*args)
          args.each { |arg| ignorable_namespaces[arg.to_sym] = true }
        end

        def ignorable_namespaces
          @ignorable_namespaces ||= {}
        end

        def active_namespaces
          @active_namespaces ||= []
        end

      end

      private

        def root_namespaces
          namespace_defs = {}
          unless self.class.ignorable_namespaces.empty?
            namespace_defs["mc:Ignorable"] = self.class.ignorable_namespaces.keys.join(" ")
            self.class.use_namespace :mc
          end
          self.class.active_namespaces.map do |prefix|
            namespace_defs["xmlns:#{prefix}"] = POSSIBLE_NAMESPACES[prefix]
          end
          namespace_defs
        end

    end
  end
end
