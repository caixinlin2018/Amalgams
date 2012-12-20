#!/bin/bash

# NOTE: The initial working directory must be
#       in the same location as the script

SRC=freetype
DEST=FreeTypeAmalgam

OPTS=(
  -i "$SRC" -i "${SRC}/include" -i "${SRC}/src/gzip" -s -w '*.c;*.h'
  -d 'FT_CONFIG_CONFIG_H=<freetype/config/ftconfig.h>'
  -d 'FT_CONFIG_STANDARD_LIBRARY_H=<freetype/config/ftstdlib.h>'
  -d 'FT_CONFIG_OPTIONS_H=<freetype/config/ftoption.h>'
  -d 'FT_CONFIG_MODULES_H=<freetype/config/ftmodule.h>'
  -d 'FT_FREETYPE_H=<freetype/freetype.h>'
  -d 'FT_MODULE_ERRORS_H=<freetype/ftmoderr.h>'
  -d 'FT_SYSTEM_H=<freetype/ftsystem.h>'
  -d 'FT_IMAGE_H=<freetype/ftimage.h>'
  -d 'FT_TYPES_H=<freetype/fttypes.h>'
  -d 'FT_LIST_H=<freetype/ftlist.h>'
  -d 'FT_OUTLINE_H=<freetype/ftoutln.h>'
  -d 'FT_SIZES_H=<freetype/ftsizes.h>'
  -d 'FT_MODULE_H=<freetype/ftmodapi.h>'
  -d 'FT_RENDER_H=<freetype/ftrender.h>'
  -d 'FT_TYPE1_TABLES_H=<freetype/t1tables.h>'
  -d 'FT_TRUETYPE_IDS_H=<freetype/ttnameid.h>'
  -d 'FT_TRUETYPE_TABLES_H=<freetype/tttables.h>'
  -d 'FT_TRUETYPE_TAGS_H=<freetype/tttags.h>'
  -d 'FT_BDF_H=<freetype/ftbdf.h>'
  -d 'FT_CID_H=<freetype/ftcid.h>'
  -d 'FT_GZIP_H=<freetype/ftgzip.h>'
  -d 'FT_LZW_H=<freetype/ftlzw.h>'
  -d 'FT_BZIP2_H=<freetype/ftbzip2.h>'
  -d 'FT_WINFONTS_H=<freetype/ftwinfnt.h>'
  -d 'FT_GLYPH_H=<freetype/ftglyph.h>'
  -d 'FT_BITMAP_H=<freetype/ftbitmap.h>'
  -d 'FT_BBOX_H=<freetype/ftbbox.h>'
  -d 'FT_CACHE_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_IMAGE_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_SMALL_BITMAPS_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_CHARMAP_H=<freetype/ftcache.h>'
  -d 'FT_MAC_H=<freetype/ftmac.h>'
  -d 'FT_MULTIPLE_MASTERS_H=<freetype/ftmm.h>'
  -d 'FT_SFNT_NAMES_H=<freetype/ftsnames.h>'
  -d 'FT_OPENTYPE_VALIDATE_H=<freetype/ftotval.h>'
  -d 'FT_GX_VALIDATE_H=<freetype/ftgxval.h>'
  -d 'FT_PFR_H=<freetype/ftpfr.h>'
  -d 'FT_STROKER_H=<freetype/ftstroke.h>'
  -d 'FT_SYNTHESIS_H=<freetype/ftsynth.h>'
  -d 'FT_XFREE86_H=<freetype/ftxf86.h>'
  -d 'FT_TRIGONOMETRY_H=<freetype/fttrigon.h>'
  -d 'FT_LCD_FILTER_H=<freetype/ftlcdfil.h>'
  -d 'FT_UNPATENTED_HINTING_H=<freetype/ttunpat.h>'
  -d 'FT_INCREMENTAL_H=<freetype/ftincrem.h>'
  -d 'FT_GASP_H=<freetype/ftgasp.h>'
  -d 'FT_ADVANCES_H=<freetype/ftadvanc.h>'
  -d 'FT_ERROR_DEFINITIONS_H=<freetype/fterrdef.h>'
  -d 'FT_CACHE_MANAGER_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_INTERNAL_MRU_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_INTERNAL_MANAGER_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_INTERNAL_CACHE_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_INTERNAL_GLYPH_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_INTERNAL_IMAGE_H=<freetype/ftcache.h>'
  -d 'FT_CACHE_INTERNAL_SBITS_H=<freetype/ftcache.h>'
  -d 'FT_INCREMENTAL_H=<freetype/ftincrem.h>'
  -d 'FT_TRUETYPE_UNPATENTED_H=<freetype/ttunpat.h>'
  -d 'FT_INTERNAL_INTERNAL_H=<freetype/internal/internal.h>'
  -d 'FT_INTERNAL_OBJECTS_H=<freetype/internal/ftobjs.h>'
  -d 'FT_INTERNAL_PIC_H=<freetype/internal/ftpic.h>'
  -d 'FT_INTERNAL_STREAM_H=<freetype/internal/ftstream.h>'
  -d 'FT_INTERNAL_MEMORY_H=<freetype/internal/ftmemory.h>'
  -d 'FT_INTERNAL_DEBUG_H=<freetype/internal/ftdebug.h>'
  -d 'FT_INTERNAL_CALC_H=<freetype/internal/ftcalc.h>'
  -d 'FT_INTERNAL_DRIVER_H=<freetype/internal/ftdriver.h>'
  -d 'FT_INTERNAL_TRACE_H=<freetype/internal/fttrace.h>'
  -d 'FT_INTERNAL_GLYPH_LOADER_H=<freetype/internal/ftgloadr.h>'
  -d 'FT_INTERNAL_SFNT_H=<freetype/internal/sfnt.h>'
  -d 'FT_INTERNAL_SERVICE_H=<freetype/internal/ftserv.h>'
  -d 'FT_INTERNAL_RFORK_H=<freetype/internal/ftrfork.h>'
  -d 'FT_INTERNAL_VALIDATE_H=<freetype/internal/ftvalid.h>'
  -d 'FT_INTERNAL_TRUETYPE_TYPES_H=<freetype/internal/tttypes.h>'
  -d 'FT_INTERNAL_TYPE1_TYPES_H=<freetype/internal/t1types.h>'
  -d 'FT_INTERNAL_POSTSCRIPT_AUX_H=<freetype/internal/psaux.h>'
  -d 'FT_INTERNAL_POSTSCRIPT_HINTS_H=<freetype/internal/pshints.h>'
  -d 'FT_INTERNAL_POSTSCRIPT_GLOBALS_H=<freetype/internal/psglobal.h>'
  -d 'FT_INTERNAL_AUTOHINT_H=<freetype/internal/autohint.h>'
  -d 'FT_SERVICE_BDF_H=<freetype/internal/services/svbdf.h>'
  -d 'FT_SERVICE_CID_H=<freetype/internal/services/svcid.h>'
  -d 'FT_SERVICE_GLYPH_DICT_H=<freetype/internal/services/svgldict.h>'
  -d 'FT_SERVICE_GX_VALIDATE_H=<freetype/internal/services/svgxval.h>'
  -d 'FT_SERVICE_KERNING_H=<freetype/internal/services/svkern.h>'
  -d 'FT_SERVICE_MULTIPLE_MASTERS_H=<freetype/internal/services/svmm.h>'
  -d 'FT_SERVICE_OPENTYPE_VALIDATE_H=<freetype/internal/services/svotval.h>'
  -d 'FT_SERVICE_PFR_H=<freetype/internal/services/svpfr.h>'
  -d 'FT_SERVICE_POSTSCRIPT_CMAPS_H=<freetype/internal/services/svpscmap.h>'
  -d 'FT_SERVICE_POSTSCRIPT_INFO_H=<freetype/internal/services/svpsinfo.h>'
  -d 'FT_SERVICE_POSTSCRIPT_NAME_H=<freetype/internal/services/svpostnm.h>'
  -d 'FT_SERVICE_PROPERTIES_H=<freetype/internal/services/svprop.h>'
  -d 'FT_SERVICE_SFNT_H=<freetype/internal/services/svsfnt.h>'
  -d 'FT_SERVICE_TRUETYPE_ENGINE_H=<freetype/internal/services/svtteng.h>'
  -d 'FT_SERVICE_TT_CMAP_H=<freetype/internal/services/svttcmap.h>'
  -d 'FT_SERVICE_WINFNT_H=<freetype/internal/services/svwinfnt.h>'
  -d 'FT_SERVICE_XFREE86_NAME_H=<freetype/internal/services/svxf86nm.h>'
  -d 'FT_SERVICE_TRUETYPE_GLYF_H=<freetype/internal/services/svttglyf.h>'
  -d 'FT_ERRORS_H=<freetype/fterrors.h>'
  -d 'FT_AUTOHINTER_H=<freetype/ftautoh.h>'
  -p FT_FREETYPE_H
  -f FT_ERRORS_H)

Amalgamate "${OPTS[@]}" templates/FreeTypeAmalgamTemplate.h $DEST/FreeTypeAmalgam.h

Amalgamate "${OPTS[@]}" templates/FreeTypeAmalgamTemplate.c $DEST/FreeTypeAmalgam.c

cd freetype
git log --date=short --format=format:'%H %ad %s' > ../FreeTypeAmalgam/COMMITLOG
