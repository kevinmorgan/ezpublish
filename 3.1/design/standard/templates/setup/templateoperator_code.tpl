/*!
  \class   {$full_class_name} {$file_name}
  \ingroup eZTemplateOperators
  \brief   {$description_brief}
  \version 1.0
  \date    {currentdate()|l10n(datetime)}

{section show=$creator_name}
  \author  {$creator_name}
{/section}


{$description_full|indent(2)}

{section show=$example_code}

  {'Example'|i18n('design/standard/setup/operatorcode')}:
\code
{$example_code}
\endcode
{/section}

*/

/*
If you want to have autoloading of this operator you should create
a eztemplateautoload.php file and add the following code to it.
The autoload file must be placed somewhere specified in AutoloadPath
under the group TemplateSettings in settings/site.ini

$eZTemplateOperatorArray = array();
$eZTemplateOperatorArray[] = array( 'script' => '{$file_name}',
                                    'class' => '$full_class_name',
                                    'operator_names' => array( '{$operator_name}' ) );

*/


class {$full_class_name}
{literal}{{/literal}
    /*!
      {'Constructor, does nothing by default.'|i18n('design/standard/setup/operatorcode')}
    */
    function {$full_class_name}()
    {literal}{{/literal}
    {literal}}{/literal}

    /*!
     {'\return an array with the template operator name.'|i18n('design/standard/setup/operatorcode')}
    */
    function operatorList()
    {literal}{{/literal}
        return array( '{$operator_name}' );
    {literal}}{/literal}

{section show=$single_operator|not}
    /*!
     \return true to tell the template engine that the parameter list exists per operator type,
             this is needed for operator classes that have multiple operators.
    */
    function namedParameterPerOperator()
    {literal}{{/literal}
        return true;
    {literal}}{/literal}
{/section}

{section show=$parameter_check|eq(2)}
    /*!
     See eZTemplateOperator::namedParameterList
    */
    function namedParameterList()
    {literal}{{/literal}
        return array( '{$operator_name}' => array( 'first_param' => array( 'type' => 'string',
{set-block variable=parameter_extra}
                        'required' => false,
                        'default' => 'default text' ),
'second_param' => array( 'type' => 'integer',
                         'required' => false,
                         'default' => 0 ) ) );
{/set-block}

{$:parameter_extra|indent(sum(35,$operator_name|count))}
    {literal}}{/literal}
{/section}

    /*!
     {'Executes the PHP function for the operator cleanup and modifies \a $operatorValue.'|i18n('design/standard/setup/operatorcode')}
    */
    function modify( &$tpl, &$operatorName, &$operatorParameters, &$rootNamespace, &$currentNamespace, &$operatorValue{section show=$parameter_check|eq(2)}, &$namedParameters{/section} )
    {literal}{{/literal}

{section show=$parameter_check|eq(2)}
        $firstParam = $namedParameters['first_param'];
        $secondParam = $namedParameters['second_param'];

{/section}

{section show=$parameter_check|eq(3)}
        for ( $i = 0; $i < count( $operatorParameters ); ++$i )
        {literal}{{/literal}
            $operatorParameter =& $operatorParameters[$i];
            // Fetch the value of the parameter structure
            $operatorParameterValue = $tpl->elementValue( $operatorParameter, $rootNamespace, $currentNamespace );
        {literal}}{/literal}

{/section}

{section show=$single_operator}
        // {'Example code, this code must be modified to do what the operator should do, currently it only trims text.'|i18n('design/standard/setup/operatorcode')}
        {section show=$use_output}$operatorValue = {/section}trim({section show=$use_input} $operatorValue {/section});
{section-else}
        // {'Example code, this code must be modified to do what the operator should do, currently it only trims text.'|i18n('design/standard/setup/operatorcode')}
        switch ( $operatorName )
        {literal}{{/literal}
            case '{$operator_name}':
            {literal}{{/literal}
                {section show=$use_output}$operatorValue = {/section}trim({section show=$use_input} $operatorValue {/section});
            {literal}}{/literal} break;
        {literal}}{/literal}
{/section}

    {literal}}{/literal}
{literal}}{/literal}
