void 0===Craft.SuperTable&&(Craft.SuperTable={}),function($){Craft.SuperTable.Input=Garnish.Base.extend({id:null,blockType:null,inputNamePrefix:null,totalNewBlocks:0,sorter:null,$div:null,$divInner:null,$table:null,$tbody:null,$addRowBtn:null,$field:null,init:function(t,e,i,s){e=e[0],"table"==s.fieldLayout?this.$field=new Craft.SuperTable.InputTable(t,e,i,s):"matrix"==s.fieldLayout?this.$field=new Craft.SuperTable.InputMatrix(t,e,i,s):this.$field=new Craft.SuperTable.InputRow(t,e,i,s)},addRow:function(){this.$field.addRow()}}),Craft.SuperTable.InputTable=Garnish.Base.extend({id:null,blockType:null,inputNamePrefix:null,totalNewBlocks:0,sorter:null,$div:null,$divInner:null,$table:null,$tbody:null,$addRowBtn:null,init:function(t,e,i,s){this.id=t,this.blockType=e,this.inputNamePrefix=i,this.setSettings(s,{rowIdPrefix:"",onAddRow:$.noop,onDeleteRow:$.proxy(this,"deleteRow")}),this.$table=$("table#"+t),this.$tbody=this.$table.children("tbody"),this.sorter=new Craft.DataTableSorter(this.$table,{handle:"td.super-table-action .move",helperClass:"editablesupertablesorthelper",copyDraggeeInputValuesToHelper:!0}),this.$addRowBtn=this.$table.next(".add"),this.addListener(this.$addRowBtn,"activate","addRow");for(var n=this.$tbody.children(),a=0;a<n.length;a++){new Craft.EditableTable.Row(this,n[a]);var l,t,d="string"==typeof(t=$(n[a]).data("id"))&&t.match(/new(\d+)/);d&&d[1]>this.totalNewBlocks&&(this.totalNewBlocks=parseInt(d[1]))}this.updateAddBlockBtn(),this.trigger("afterInit")},addRow:function(){var t=this.blockType.type,e=this.settings.staticField;this.totalNewBlocks++;var i="new"+this.totalNewBlocks,s=this.getParsedBlockHtml(this.blockType.bodyHtml,i),n=this.getParsedBlockHtml(this.blockType.footHtml,i),a='<tr data-id="'+i+'" data-type="'+t+'"><input type="hidden" name="'+this.inputNamePrefix+'[sortOrder][]" value="'+i+'" /><input type="hidden" name="'+this.inputNamePrefix+"[blocks]["+i+'][type]" value="'+t+'" />'+s;e||(a+='<td class="thin action super-table-action"><a class="move icon" title="'+Craft.t("super-table","Reorder")+'"></a></td><td class="thin action super-table-action"><a class="delete icon" title="'+Craft.t("super-table","Delete")+'"></a></td>');var l=$(a+="</tr>").appendTo(this.$tbody);Garnish.$bod.append(n),this.trigger("blockAdded",{$block:l}),Craft.initUiElements(l),new Craft.EditableTable.Row(this,l),this.sorter.addItems(l),this.updateAddBlockBtn()},getParsedBlockHtml:function(t,e){return"string"==typeof t?t.replace(new RegExp(`__BLOCK_${this.settings.placeholderKey}__`,"g"),e):""},canAddMoreRows:function(){return!this.settings.maxRows||this.$tbody.children().length<this.settings.maxRows},updateAddBlockBtn:function(){this.canAddMoreRows()?this.$addRowBtn.removeClass("disabled"):this.$addRowBtn.addClass("disabled")},canDeleteRows:function(){return!this.settings.minRows||this.$tbody.children().length>this.settings.minRows},deleteRow:function(t){this.canDeleteRows()&&(window.draftEditor&&window.draftEditor.pause(),this.sorter.removeItems(t.$tr),t.$tr.remove(),this.updateAddBlockBtn(),window.draftEditor&&window.draftEditor.resume())}}),Craft.SuperTable.InputRow=Garnish.Base.extend({id:null,blockType:null,inputNamePrefix:null,settings:null,totalNewBlocks:0,sorter:null,$div:null,$divInner:null,$rows:null,$table:null,$tbody:null,$addRowBtn:null,init:function(t,e,i,s){this.id=t,this.blockType=e,this.inputNamePrefix=i,this.settings=s,this.$div=$("div#"+t),this.$divInner=this.$div.children(".rowLayoutContainer"),this.$rows=this.$divInner.children(".superTableRow"),this.sorter=new Garnish.DragSort(this.$rows,{handle:".tfoot-actions .reorder .move",axis:"y",collapseDraggees:!0,magnetStrength:4,helperLagBase:1.5,helperOpacity:.9,onDragStop:()=>{this.trigger("blockSortDragStop")}});for(var n=0;n<this.$rows.length;n++){new Craft.SuperTable.InputRow.Row(this,this.$rows[n]);var a,t,l="string"==typeof(t=$(this.$rows[n]).data("id"))&&t.match(/new(\d+)/);l&&l[1]>this.totalNewBlocks&&(this.totalNewBlocks=parseInt(l[1]))}this.$addRowBtn=this.$divInner.next(".add"),this.addListener(this.$addRowBtn,"activate","addRow"),this.updateAddBlockBtn(),this.addListener(this.$div,"resize","onResize"),Garnish.$doc.ready($.proxy(this,"onResize")),this.trigger("afterInit")},addRow:function(){var t=this.blockType.type,e=this.settings.staticField;this.totalNewBlocks++;var i="new"+this.totalNewBlocks,s=this.getParsedBlockHtml(this.blockType.bodyHtml,i),n=this.getParsedBlockHtml(this.blockType.footHtml,i),a='<div class="superTableRow" data-id="'+i+'" data-type="'+t+'"><input type="hidden" name="'+this.inputNamePrefix+'[sortOrder][]" value="'+i+'"><input type="hidden" name="'+this.inputNamePrefix+"[blocks]["+i+'][type]" value="'+t+'"><div id="'+i+'" class="superTable-layout-row-new"><div class="superTable-layout-row-new-body '+(e?"static-field":"")+'">'+s+"</div>";e||(a+='<div class="superTable-layout-row-new-actions tfoot-actions"><div class="floating reorder"><a class="move icon" title="'+Craft.t("super-table","Reorder")+'"></a></div><div class="floating delete"><a class="delete icon" title="'+Craft.t("super-table","Delete")+'"></a></div></div>');var l=$(a+="</div></div>").appendTo(this.$divInner);Garnish.$bod.append(n),this.trigger("blockAdded",{$block:l}),Craft.initUiElements(l);var d=new Craft.SuperTable.InputRow.Row(this,l);this.sorter.addItems(l),this.updateAddBlockBtn()},getParsedBlockHtml:function(t,e){return"string"==typeof t?t.replace(new RegExp(`__BLOCK_${this.settings.placeholderKey}__`,"g"),e):""},canAddMoreRows:function(){return!this.settings.maxRows||this.$divInner.children(".superTableRow").length<this.settings.maxRows},onResize:function(){var t=this.$divInner.find(".tfoot-actions").width(),e=this.$divInner.find(".rowHeader").width(),i=this.$divInner.width()-t-e-20,s=this.$divInner.find(".matrix.matrix-field");s.length&&$.each(s,(function(t,e){var s=$(e),n;s.find(".buttons").outerWidth(!0)>i&&s.trigger("showNewBlockBtn")}))},updateAddBlockBtn:function(){this.canAddMoreRows()?this.$addRowBtn.removeClass("disabled"):this.$addRowBtn.addClass("disabled")}}),Craft.SuperTable.InputRow.Row=Garnish.Base.extend({table:null,$tr:null,$deleteBtn:null,init:function(t,e){this.table=t,this.$tr=$(e);var i=this.$tr.children().last().find("> .tfoot-actions .delete");this.addListener(i,"click","deleteRow")},canDeleteRows:function(){return!this.table.settings.minRows||this.table.$divInner.children(".superTableRow").length>this.table.settings.minRows},deleteRow:function(){this.canDeleteRows()&&(window.draftEditor&&window.draftEditor.pause(),this.table.sorter.removeItems(this.$tr),this.$tr.remove(),this.table.updateAddBlockBtn(),window.draftEditor&&window.draftEditor.resume())}}),Craft.SuperTable.InputMatrix=Garnish.Base.extend({id:null,blockType:null,inputNamePrefix:null,settings:null,totalNewBlocks:0,sorter:null,$div:null,$divInner:null,$rows:null,$table:null,$tbody:null,$addRowBtn:null,init:function(t,e,i,s){this.id=t,this.blockType=e,this.inputNamePrefix=i,this.settings=s,this.$div=$("div#"+t),this.$divInner=this.$div.children(".matrixLayoutContainer"),this.$rows=this.$divInner.children(".superTableMatrix"),collapsedRows=Craft.SuperTable.InputMatrix.getCollapsedBlockIds(),this.sorter=new Garnish.DragSort(this.$rows,{handle:"> .actions .move",axis:"y",collapseDraggees:!0,magnetStrength:4,helperLagBase:1.5,helperOpacity:.9,onDragStop:()=>{this.trigger("blockSortDragStop")}});for(var n=0;n<this.$rows.length;n++){var a=new Craft.SuperTable.InputMatrix.Row(this,this.$rows[n]),l,t,d="string"==typeof(t=$(this.$rows[n]).data("id"))&&t.match(/new(\d+)/);d&&d[1]>this.totalNewBlocks&&(this.totalNewBlocks=parseInt(d[1])),t&&-1!==$.inArray(""+t,collapsedRows)&&a.collapse()}this.$addRowBtn=this.$divInner.next(".add"),this.addListener(this.$addRowBtn,"activate","addRow"),this.updateAddBlockBtn(),this.addListener(this.$div,"resize","onResize"),Garnish.$doc.ready($.proxy(this,"onResize")),this.trigger("afterInit")},addRow:function(){var t=this.blockType.type,e=this.settings.staticField;this.totalNewBlocks++;var i="new"+this.totalNewBlocks,s=this.getParsedBlockHtml(this.blockType.bodyHtml,i),n=this.getParsedBlockHtml(this.blockType.footHtml,i),a='<div class="superTableMatrix matrixblock '+(e?"static":"")+'" data-id="'+i+'"><input type="hidden" name="'+this.inputNamePrefix+'[sortOrder][]" value="'+i+'"><input type="hidden" name="'+this.inputNamePrefix+"[blocks]["+i+'][type]" value="'+t+'">';e||(a+='<div class="titlebar"><div class="blocktype"></div><div class="preview"></div></div><div class="actions"><a class="settings icon menubtn" title="'+Craft.t("app","Actions")+'" role="button"></a><div class="menu"><ul class="padded"><li><a data-icon="collapse" data-action="collapse">'+Craft.t("app","Collapse")+'</a></li><li class="hidden"><a data-icon="expand" data-action="expand">'+Craft.t("app","Expand")+'</a></li></ul><hr class="padded"><ul class="padded"><li><a class="error" data-icon="remove" data-action="delete">'+Craft.t("super-table","Delete")+'</a></li></ul></div><a class="move icon" title="'+Craft.t("super-table","Reorder")+'" role="button"></a></div>');var l=$(a+='<div class="fields">'+s+"</div></div>").appendTo(this.$divInner);Garnish.$bod.append(n),Craft.initUiElements(l),this.trigger("blockAdded",{$block:l});var d=new Craft.SuperTable.InputMatrix.Row(this,l);this.sorter.addItems(l),d.expand(),this.updateAddBlockBtn()},getParsedBlockHtml:function(t,e){return"string"==typeof t?t.replace(new RegExp(`__BLOCK_${this.settings.placeholderKey}__`,"g"),e):""},canAddMoreRows:function(){return!this.settings.maxRows||this.$divInner.children(".superTableMatrix").length<this.settings.maxRows},onResize:function(){var t=this.$divInner.width()-20,e=this.$divInner.find(".matrix.matrix-field");e.length&&$.each(e,(function(e,i){var s=$(i),n;s.find(".buttons").outerWidth(!0)>t&&s.trigger("showNewBlockBtn")}))},updateAddBlockBtn:function(){this.canAddMoreRows()?this.$addRowBtn.removeClass("disabled"):this.$addRowBtn.addClass("disabled")}},{collapsedBlockStorageKey:"Craft-"+Craft.systemUid+".SuperTable.InputMatrix.collapsedBlocks",getCollapsedBlockIds:function(){return"string"==typeof localStorage[Craft.SuperTable.InputMatrix.collapsedBlockStorageKey]?Craft.filterArray(localStorage[Craft.SuperTable.InputMatrix.collapsedBlockStorageKey].split(",")):[]},setCollapsedBlockIds:function(t){localStorage[Craft.SuperTable.InputMatrix.collapsedBlockStorageKey]=t.join(",")},rememberCollapsedBlockId:function(t){if("undefined"!=typeof Storage){var e=Craft.SuperTable.InputMatrix.getCollapsedBlockIds();-1===$.inArray(""+t,e)&&(e.push(t),Craft.SuperTable.InputMatrix.setCollapsedBlockIds(e))}},forgetCollapsedBlockId:function(t){if("undefined"!=typeof Storage){var e=Craft.SuperTable.InputMatrix.getCollapsedBlockIds(),i=$.inArray(""+t,e);-1!==i&&(e.splice(i,1),Craft.SuperTable.InputMatrix.setCollapsedBlockIds(e))}}}),Craft.SuperTable.InputMatrix.Row=Garnish.Base.extend({table:null,$tr:null,$deleteBtn:null,$titlebar:null,$actionMenu:null,id:null,collapsed:!1,$previewContainer:null,$fieldsContainer:null,init:function(t,e){this.table=t,this.$tr=$(e),this.id=this.$tr.data("id"),this.$titlebar=this.$tr.children(".titlebar"),this.$previewContainer=this.$titlebar.children(".preview"),this.$fieldsContainer=this.$tr.children(".fields");var i=this.$tr.find("> .actions > .settings");if(i){var s=new Garnish.MenuBtn(i);s.menu&&(this.$actionMenu=s.menu.$container,s.menu.settings.onOptionSelect=$.proxy(this,"onMenuOptionSelect"))}Garnish.hasAttr(this.$tr,"data-collapsed")&&this.collapse(),this._handleTitleBarClick=function(t){t.preventDefault(),this.toggle()},this.addListener(this.$titlebar,"doubletap",this._handleTitleBarClick)},deleteRow:function(){this.table.sorter.removeItems(this.$tr),window.draftEditor&&window.draftEditor.pause(),this.$tr.velocity({opacity:0,marginBottom:-this.$tr.outerHeight()},"fast",$.proxy((function(){this.$tr.remove(),this.table.updateAddBlockBtn(),window.draftEditor&&window.draftEditor.resume()}),this))},toggle:function(){this.collapsed?this.expand():this.collapse(!0)},collapse:function(t){if(!this.collapsed){this.$tr.addClass("collapsed");for(var e="",i=this.$fieldsContainer.children(),s=0;s<i.length;s++){for(var n,a=$(i[s]).find(".input").find('select,input[type!="hidden"],textarea,.label'),l="",d=0;d<a.length;d++){var r=$(a[d]),o;if(r.hasClass("label")){var h=r.parent().parent();if(h.hasClass("lightswitch")&&(h.hasClass("on")&&r.hasClass("off")||!h.hasClass("on")&&r.hasClass("on")))continue;o=r.text()}else o=Craft.getText(this._inputPreviewText(r));o instanceof Array&&(o=o.join(", ")),o&&(o=Craft.trim(Craft.escapeHtml(o)))&&(l&&(l+=", "),l+=o)}l&&(e+=(e?" <span>|</span> ":"")+l)}this.$previewContainer.html(e),this.$fieldsContainer.velocity("stop"),this.$tr.velocity("stop"),t?(this.$fieldsContainer.velocity("fadeOut",{duration:"fast"}),this.$tr.velocity({height:32},"fast")):(this.$previewContainer.show(),this.$fieldsContainer.hide(),this.$tr.css({height:32})),setTimeout($.proxy((function(){this.$actionMenu.find("a[data-action=collapse]:first").parent().addClass("hidden"),this.$actionMenu.find("a[data-action=expand]:first").parent().removeClass("hidden")}),this),200),this.isNew?this.$collapsedInput?this.$collapsedInput.val("1"):this.$collapsedInput=$('<input type="hidden" name="'+this.matrix.inputNamePrefix+"["+this.id+'][collapsed]" value="1"/>').appendTo(this.$container):Craft.SuperTable.InputMatrix.rememberCollapsedBlockId(this.id),this.collapsed=!0}},_inputPreviewText:function(t){if(t.is("select,multiselect")){const e=[],i=t.find("option:selected");for(let t=0;t<i.length;t++)e.push(i.eq(t).text());return e}if(t.is('input[type="checkbox"]:checked,input[type="radio"]:checked')){const e=t.attr("id"),i=$(`label[for="${e}"]`);if(i.length)return i.text()}return Garnish.getInputPostVal(t)},expand:function(){if(this.collapsed){this.$tr.removeClass("collapsed"),this.$fieldsContainer.velocity("stop"),this.$tr.velocity("stop");var t=this.$tr.height();this.$tr.height("auto"),this.$fieldsContainer.show();var e=this.$tr.height(),i=this.$fieldsContainer.css("display")||"block";if(this.$tr.height(t),this.$fieldsContainer.hide().velocity("fadeIn",{duration:"fast",display:i}),this.$tr.velocity({height:e},"fast",$.proxy((function(){this.$previewContainer.html(""),this.$tr.height("auto")}),this)),setTimeout($.proxy((function(){this.$actionMenu.find("a[data-action=collapse]:first").parent().removeClass("hidden"),this.$actionMenu.find("a[data-action=expand]:first").parent().addClass("hidden")}),this),200),!this.isNew&&"undefined"!=typeof Storage){var s=Craft.SuperTable.InputMatrix.getCollapsedBlockIds(),n=$.inArray(""+this.id,s);-1!==n&&(s.splice(n,1),Craft.SuperTable.InputMatrix.setCollapsedBlockIds(s))}this.isNew?this.$collapsedInput&&this.$collapsedInput.val(""):Craft.SuperTable.InputMatrix.forgetCollapsedBlockId(this.id),this.collapsed=!1}},onMenuOptionSelect:function(t){var e;switch($(t).data("action")){case"collapse":this.collapse(!0);break;case"expand":this.expand();break;case"delete":this.deleteRow();break}}})}(jQuery),void 0===Craft.SuperTable&&(Craft.SuperTable={}),function($){Craft.SuperTable.Configurator=Garnish.Base.extend({fieldTypeInfo:null,inputNamePrefix:null,inputIdPrefix:null,fieldTypeSettingsNamespace:null,placeholderKey:null,blockTypeId:null,blockTypeNamePrefix:null,blockTypeIdPrefix:null,$container:null,$fieldsColumnContainer:null,$fieldSettingsColumnContainer:null,$fieldItemsContainer:null,$fieldSettingItemsContainer:null,$newFieldBtn:null,fields:null,selectedField:null,fieldSort:null,totalNewFields:0,fieldSettings:null,_fieldTypeSettingsHtml:null,_cancelToken:null,_ignoreFailedRequest:!1,init:function(t,e,i,s,n){this.fieldTypeSettingsNamespace=s,this.fieldTypeInfo=e,this.id=t,this.placeholderKey=n,this.inputNamePrefix=i+"[blockTypes]["+this.id+"]",this.inputIdPrefix=Craft.formatInputId(this.inputNamePrefix),this.$container=$("#"+Craft.formatInputId(i)+"-supertable-configurator:first .input:first"),this.$fieldsColumnContainer=this.$container.children(".fields").children(),this.$fieldSettingsColumnContainer=this.$container.children(".stc-settings").children(),this.$fieldItemsOuterContainer=this.$fieldsColumnContainer.children(".field-items"),this.$fieldSettingItemsContainer=this.$fieldSettingsColumnContainer.children(".field-items"),this._fieldTypeSettingsHtml={},this.$newFieldBtn=this.$fieldItemsOuterContainer.children(".btn"),this.$fieldItemsContainer=this.$fieldItemsOuterContainer.children('[data-id="'+this.id+'"]:first'),this.$fieldItemsContainer.length||(this.$fieldItemsContainer=$('<div data-id="'+this.id+'"/>').insertBefore(this.$newFieldBtn)),this.$fieldSettingsContainer=this.$fieldSettingItemsContainer.children('[data-id="'+this.id+'"]:first'),this.$fieldSettingsContainer.length||(this.$fieldSettingsContainer=$('<div data-id="'+this.id+'"/>').appendTo(this.$fieldSettingItemsContainer)),this.fields={};for(var a=this.$fieldItemsContainer.children(),l=0;l<a.length;l++){var d=$(a[l]),t=d.data("id");this.fields[t]=new Craft.SuperTable.Field(this,this,d),0==l&&this.fields[t].select();var r="string"==typeof t&&t.match(/new(\d+)/);r&&r[1]>this.totalNewFields&&(this.totalNewFields=parseInt(r[1]))}this.addListener(this.$newFieldBtn,"click","addField"),this.fieldSort=new Garnish.DragSort(a,{handle:".move",axis:"y",onSortChange:$.proxy((function(){for(var t=0;t<this.fieldSort.$items.length;t++){var e,i=$(this.fieldSort.$items[t]).data("id"),s;this.fields[i].$fieldSettingsContainer.appendTo(this.$fieldSettingsContainer)}}),this)})},getFieldTypeInfo:function(t){for(var e=0;e<this.fieldTypeInfo.length;e++)if(this.fieldTypeInfo[e].type===t)return this.fieldTypeInfo[e]},addField:function(){this.totalNewFields++;var t="new"+this.totalNewFields,e=$('<div class="supertableconfigitem stci-field" data-id="'+t+'"><div class="name"><em class="light">'+Craft.t("super-table","(blank)")+'</em>&nbsp;</div><div class="handle code">&nbsp;</div><div class="actions"><a class="move icon" title="'+Craft.t("super-table","Reorder")+'"></a></div></div>').appendTo(this.$fieldItemsContainer);this.fields[t]=new Craft.SuperTable.Field(this,this,e),this.fields[t].select(),this.fieldSort.addItems(e)},getFieldTypeSettingsHtml:function(t){return new Promise(((e,i)=>{void 0===this._fieldTypeSettingsHtml[t]?(this._cancelToken&&(this._ignoreFailedRequest=!0,this._cancelToken.cancel(),Garnish.requestAnimationFrame((()=>{this._ignoreFailedRequest=!1}))),this._cancelToken=axios.CancelToken.source(),Craft.sendActionRequest("POST","fields/render-settings",{cancelToken:this._cancelToken.token,data:{type:t,namespace:this.fieldTypeSettingsNamespace}}).then((i=>{this._fieldTypeSettingsHtml[t]=i.data,e(i.data)})).catch((()=>{this._ignoreFailedRequest||Craft.cp.displayError(Craft.t("app","A server error occurred.")),i()}))):e(this._fieldTypeSettingsHtml[t])}))}}),Craft.SuperTable.Field=Garnish.Base.extend({configurator:null,blockType:null,id:null,inputNamePrefix:null,inputIdPrefix:null,selectedFieldType:null,initializedFieldTypeSettings:null,$item:null,$nameLabel:null,$handleLabel:null,$fieldSettingsContainer:null,$nameInput:null,$handleInput:null,$requiredCheckbox:null,$typeSelect:null,$typeSettingsContainer:null,$deleteBtn:null,init:function(t,e,i){this.configurator=t,this.blockType=e,this.$item=i,this.id=this.$item.data("id"),this.inputNamePrefix=this.blockType.inputNamePrefix+"[fields]["+this.id+"]",this.inputIdPrefix=this.blockType.inputIdPrefix+"-fields-"+this.id,this.initializedFieldTypeSettings={},this.fieldTypeSettingsTemplates={},this.$nameLabel=this.$item.children(".name"),this.$handleLabel=this.$item.children(".handle"),this.$fieldSettingsContainer=this.blockType.$fieldSettingsContainer.children('[data-id="'+this.id+'"]:first');var s=!this.$fieldSettingsContainer.length;s&&(this.$fieldSettingsContainer=this.getDefaultFieldSettings().appendTo(this.blockType.$fieldSettingsContainer)),this.$nameInput=$("#"+this.inputIdPrefix+"-name"),this.$handleInput=$("#"+this.inputIdPrefix+"-handle"),this.$requiredCheckbox=$("#"+this.inputIdPrefix+"-required"),this.$typeSelect=$("#"+this.inputIdPrefix+"-type"),this.$translationSettingsContainer=$("#"+this.inputIdPrefix+"-translation-settings"),this.$typeSettingsContainer=this.$fieldSettingsContainer.children(".fieldtype-settings:first"),this.$deleteBtn=this.$fieldSettingsContainer.children("a.delete:first"),s?this.setFieldType("craft\\fields\\PlainText"):(this.selectedFieldType=this.$typeSelect.val(),this.initializedFieldTypeSettings[this.selectedFieldType]=this.$typeSettingsContainer.children()),this.$handleInput.val()||new Craft.HandleGenerator(this.$nameInput,this.$handleInput),this.addListener(this.$item,"click","select"),this.addListener(this.$nameInput,"input","updateNameLabel"),this.addListener(this.$handleInput,"input","updateHandleLabel"),this.addListener(this.$requiredCheckbox,"change","updateRequiredIcon"),this.addListener(this.$typeSelect,"change","onTypeSelectChange"),this.addListener(this.$deleteBtn,"click","confirmDelete")},select:function(){this.blockType.selectedField!==this&&(this.blockType.selectedField&&this.blockType.selectedField.deselect(),this.configurator.$fieldSettingsColumnContainer.removeClass("hidden").trigger("resize"),this.blockType.$fieldSettingsContainer.removeClass("hidden"),this.$fieldSettingsContainer.removeClass("settings-hidden"),this.$item.addClass("sel"),this.blockType.selectedField=this,Garnish.isMobileBrowser()||setTimeout($.proxy((function(){this.$nameInput.focus()}),this),100),Garnish.$win.trigger("resize"))},deselect:function(){this.$item.removeClass("sel"),this.configurator.$fieldSettingsColumnContainer.addClass("hidden").trigger("resize"),this.blockType.$fieldSettingsContainer.addClass("hidden"),this.$fieldSettingsContainer.addClass("settings-hidden"),this.blockType.selectedField=null},updateNameLabel:function(){var t=this.$nameInput.val();this.$nameLabel.html((t?Craft.escapeHtml(t):'<em class="light">'+Craft.t("super-table","(blank)")+"</em>")+"&nbsp;")},updateHandleLabel:function(){this.$handleLabel.html(Craft.escapeHtml(this.$handleInput.val())+"&nbsp;")},updateRequiredIcon:function(){this.$requiredCheckbox.prop("checked")?this.$nameLabel.addClass("required"):this.$nameLabel.removeClass("required")},onTypeSelectChange:function(){this.setFieldType(this.$typeSelect.val())},setFieldType:function(t){Craft.updateTranslationMethodSettings(t,this.$translationSettingsContainer),this.selectedFieldType&&this.initializedFieldTypeSettings[this.selectedFieldType].detach(),this.selectedFieldType=t,this.$typeSelect.val(t),this.$typeSettingsContainer.html('<div class="zilch"><div class="spinner"></div></div>'),this.getFieldTypeSettings(t).then((({fresh:t,$settings:e,headHtml:i,bodyHtml:s})=>{this.$typeSettingsContainer.html("").append(e),t&&(Craft.initUiElements(e),Craft.appendHeadHtml(i),Craft.appendBodyHtml(s)),this.$typeSettingsContainer.trigger("resize")})).catch((()=>{this.$typeSettingsContainer.html("")}))},getFieldTypeSettings:function(t){return new Promise(((e,i)=>{void 0===this.initializedFieldTypeSettings[t]?this.configurator.getFieldTypeSettingsHtml(t).then((({settingsHtml:i,headHtml:s,bodyHtml:n})=>{i=this.getParsedFieldTypeHtml(i),s=this.getParsedFieldTypeHtml(s),n=this.getParsedFieldTypeHtml(n);let a=$("<div/>").html(i);this.initializedFieldTypeSettings[t]=a,e({fresh:!0,$settings:a,headHtml:s,bodyHtml:n})})).catch($.noop):e({fresh:!1,$settings:this.initializedFieldTypeSettings[t]})}))},getParsedFieldTypeHtml:function(t){return t="string"==typeof t?(t=t.replace(new RegExp(`__BLOCK_TYPE_${this.configurator.placeholderKey}__`,"g"),this.blockType.id)).replace(new RegExp(`__FIELD_${this.configurator.placeholderKey}__`,"g"),this.id):""},getDefaultFieldSettings:function(){var t=$("<div/>",{"data-id":this.id});Craft.ui.createTextField({label:Craft.t("super-table","Name"),id:this.inputIdPrefix+"-name",name:this.inputNamePrefix+"[name]"}).appendTo(t),Craft.ui.createTextField({label:Craft.t("super-table","Handle"),id:this.inputIdPrefix+"-handle",class:"code",name:this.inputNamePrefix+"[handle]",maxlength:64,required:!0}).appendTo(t),Craft.ui.createTextareaField({label:Craft.t("super-table","Instructions"),id:this.inputIdPrefix+"-instructions",class:"nicetext",name:this.inputNamePrefix+"[instructions]"}).appendTo(t),Craft.ui.createTextField({label:Craft.t("super-table","Column Width"),instructions:Craft.t("super-table","Please save this Super Table field first to edit its width."),size:8,disabled:!0}).appendTo(t),Craft.ui.createCheckboxField({label:Craft.t("super-table","This field is required"),id:this.inputIdPrefix+"-required",name:this.inputNamePrefix+"[required]"}).appendTo(t),Craft.ui.createCheckboxField({label:Craft.t("app","Use this field’s values as search keywords"),id:this.inputIdPrefix+"-searchable",name:this.inputNamePrefix+"[searchable]",checked:!1}).appendTo(t);for(var e=[],i=0;i<this.configurator.fieldTypeInfo.length;i++)e.push({value:this.configurator.fieldTypeInfo[i].type,label:this.configurator.fieldTypeInfo[i].name});if(Craft.ui.createSelectField({label:Craft.t("super-table","Field Type"),id:this.inputIdPrefix+"-type",name:this.inputNamePrefix+"[type]",options:e,value:"craft\\fields\\PlainText"}).appendTo(t),Craft.isMultiSite){var s=$("<div/>",{id:this.inputIdPrefix+"-translation-settings"}).appendTo(t);Craft.ui.createSelectField({label:Craft.t("super-table","Translation Method"),id:this.inputIdPrefix+"-translation-method",name:this.inputNamePrefix+"[translationMethod]",options:[],value:"none",toggle:!0,targetPrefix:this.inputIdPrefix+"-translation-method-"}).appendTo(s);var n=$("<div/>",{id:this.inputIdPrefix+"-translation-method-custom",class:"hidden"}).appendTo(s);Craft.ui.createTextField({label:Craft.t("super-table","Translation Key Format"),id:this.inputIdPrefix+"-translation-key-format",name:this.inputNamePrefix+"[translationKeyFormat]"}).appendTo(n)}return $("<hr/>").appendTo(t),$("<div/>",{class:"fieldtype-settings"}).appendTo(t),$("<hr/>").appendTo(t),$("<a/>",{class:"error delete",text:Craft.t("super-table","Delete")}).appendTo(t),t},confirmDelete:function(){confirm(Craft.t("super-table","Are you sure you want to delete this field?"))&&this.selfDestruct()},selfDestruct:function(){this.deselect(),this.$item.remove(),this.$fieldSettingsContainer.remove(),this.blockType.fields[this.id]=null,delete this.blockType.fields[this.id]}})}(jQuery);
//# sourceMappingURL=super-table.js.map